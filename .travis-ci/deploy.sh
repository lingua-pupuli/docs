#!/bin/sh

# Setup git info to actually do a commit
git config --global user.email "54143644+lingua-pupuli-bot@users.noreply.github.com"
git config --global user.name "Lingua Pupuli Bot"

# If a command fails then the deploy stops
set -e

# ------ VSCode Website
# Go To Public folder
pushd public/vscode

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push -q https://lingua-pupuli-bot:${GITHUB_TOKEN}@github.com/puppet-vscode/puppet-vscode.github.io.git master
popd
