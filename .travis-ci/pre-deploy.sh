#!/bin/sh

# Enable globs for rm
shopt -s extglob;

# Prep the output repositories
rm -rf public/
git clone https://github.com/puppet-vscode/puppet-vscode.github.io.git public/vscode --depth 1

# Prune the old content...
pushd public/vscode
rm -rf !(.git)
popd
