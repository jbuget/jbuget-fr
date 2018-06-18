#!/usr/bin/env bash

echo -e "Delete old generated files"
rm -rf dist node_modules tmp

echo -e "Install dependencies"
npm install

echo -e "Bundle the application for Production"
ember build --production

echo -e "Create a temporary folder"
tmp_dir=$(mktemp -d)

echo -e "Clone the sources into tmp dir $tmp_dir"
git clone git@github.com:jbuget/jbuget.github.io.git $tmp_dir

echo -e "Delete all the old files"
rm -rf $tmp_dir/*

echo -e "Copy the new bundled files"
cp -R dist/* $tmp_dir

echo -e "Go to $tmp_dir"
cd $tmp_dir

echo -e "Create and push new release commit"
git add .
git commit -m "Release a new version"
git push

echo -e "Release succeeded :D"
