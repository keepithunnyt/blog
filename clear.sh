#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t vanilla-bootstrap-hugo-theme
# if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
git pull origin master

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; 
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

cd ..
# anyblogname 업데이트
git pull origin master
git add .

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin master



