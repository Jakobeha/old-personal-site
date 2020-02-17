#!/bin/bash

# From https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html

# Temporarily store uncommited changes
git stash

# Verify correct branch
git checkout develop

# Build source
cabal new-build

# Build new files
cabal exec site clean
cabal exec site build

# Get previous files
git fetch --all
git checkout -b master --track origin/master

# Overwrite existing files with new files
mkdir ../jakobeha-website-build
cp -r .git ../jakobeha-website-build
cp -r _site ../jakobeha-website-build
rm -rf ./*
mv ../jakobeha-website-build/.git .
mv ../jakobeha-website-build/_site/ .
rmdir ../jakobeha-website-build

# Commit
git add -A
git commit -m "Publish."

# Push
git push origin master:master

# Restoration
git checkout develop
git branch -D master
git stash pop
