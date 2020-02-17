--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid                    ( mappend )
import           Hakyll
import           System.FilePath

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith configuration $ do
    match "resources/images/*" $ do
        route idRoute
        compile copyFileCompiler

    match "resources/css/*" $ do
        route idRoute
        compile compressCssCompiler

    match "pages/*.md" $ do
        route $ gsubRoute "pages/" (const "") `composeRoutes` setExtension
            "html"
        compile
            $   pandocCompiler
            >>= saveSnapshot "before templates"
            >>= fixTemplateDelimiters
            >>= applyAsTemplate pageContext
            >>= loadAndApplyTemplate "templates/default.html" pageContext
            >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
configuration :: Configuration
configuration = defaultConfiguration { deployCommand = "./deploy.sh" }

pageContext :: Context String
pageContext = mconcat
    [ listField
        "links"
        pageContext
        (   filter ((/= "index") . takeBaseName . toFilePath . itemIdentifier)
        <$> loadAllSnapshots "pages/*.md" "before templates"
        )
    , defaultContext
    ]

-- | Convert {{foo}} (mustache-like) into $foo$, since the latter is MathJax in markdown
fixTemplateDelimiters :: Item String -> Compiler (Item String)
fixTemplateDelimiters = withItemBody $ pure . fixTemplateDelimitersInString
  where
    fixTemplateDelimitersInString [] = []
    fixTemplateDelimitersInString ('{' : '{' : xs) =
        '$' : fixTemplateDelimitersInString xs
    fixTemplateDelimitersInString ('}' : '}' : xs) =
        '$' : fixTemplateDelimitersInString xs
    fixTemplateDelimitersInString (x : xs) =
        x : fixTemplateDelimitersInString xs
