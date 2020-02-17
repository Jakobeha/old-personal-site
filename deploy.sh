#!/bin/bash

# Modified from https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html

# Verify correct branch
git checkout develop

# Build source
cabal new-build

# Build new files
cabal exec site clean
cabal exec site build

# Create build dir for master branch
BUILD_DIR=`mktemp -d`
function cleanup {
  rm -rf "$BUILD_DIR"
}
trap cleanup EXIT
cp -r .git "$BUILD_DIR/"
cp -r _site/* "$BUILD_DIR/"

# Move to this dir, checkout master branch with old commits
cd "$BUILD_DIR"
git checkout -b master
git fetch
git reset origin/master

# Commit and push new changes
git add -A
git commit -m "publish"
git push origin master
