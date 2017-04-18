#!/bin/bash

# This script should be placed inside the GitLab project-name.wiki/ folder
# Right outside the .git folder

# It does not search recursively, only within the same directory level from which it is run.
# It only works for files with .md extension

# Make sure when no files are found that '*.md' is not the value of the variable
echo "Setting nullglob"
shopt -s nullglob

for wikiFile in *.md; do
  fileNameNoExtension="${wikiFile/.md/}"
  
  foundInAtLeastOneFile=0
  
  for otherWikiFile in *.md; do
    if grep -q "$fileNameNoExtension" "$otherWikiFile";
    then
      foundInAtLeastOneFile=1
      break
    fi
  done
  
  if [ "$foundInAtLeastOneFile" -eq 0 ]
  then
    echo "$wikiFile";
  fi
done


# Set nullglob value back 'unset' as 'unset' is usually the default
echo "Un-setting nullglob (usually back to default)"
shopt -u nullglob