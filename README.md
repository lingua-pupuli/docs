# The central Lingua-Pupuli docs site

[![Build Status](https://travis-ci.com/lingua-pupuli/docs.svg?branch=master)](https://travis-ci.com/lingua-pupuli/docs)

## Cloning

This project uses git submodules

```
git clone --recurse-submodules https://github.com/lingua-pupuli/docs.git
```

To update the Docsy theme use

```
git submodule update --init --recursive --depth 50
```

## Requirements

- Hugo Extended. See [Docsy Getting Started](https://www.docsy.dev/docs/getting-started/#prerequisites-and-installation) for more information.

For Windows users, chocolatey hosts a [Hugo Extended package](https://chocolatey.org/packages/hugo-extended)

- NodeJS with PostCSS installed.  This is available via `npm install`. See [Docsy Getting Started](https://www.docsy.dev/docs/getting-started/#install-postcss) for more information.

## Lingua-Pupuli Umbrella Project

This hugo site needs the editor-services and editor-syntax site built first, into the `lingua-pupuli/static/<...>` directory

```
> hugo --source editor-services --destination '../lingua-pupuli/static/editor-services'

> hugo --source editor-syntax --destination '../lingua-pupuli/static/editor-syntax'

> hugo server --bind "0.0.0.0" --source lingua-pupuli
```

## VSCode

```
hugo server --bind "0.0.0.0" --source vscode
```

## Updating the websites from source code

Parts of the websites are automatically generated from source code (e.g. the VS Code `package.json` file). A  PowerShell script has been created to automatically parse the source code, and update the relevant websites.

Steps:

1. Clone the source repositories and checkout their required branch/tag/reference. Note the directories where they were cloned to as it is required for step 2.

    - Puppet VS Code Extension : https://github.com/lingua-pupuli/puppet-vscode.git

2. Run the `update-from-source.ps1` PowerShell script.

``` powershell

> .\update-from-source.ps1 -ExtensionSourcePath '<Path to Puppet VS Code Extension>'

```

3. Commit the changes and create a Pull Request to merge them into the docs repository.

## Guidelines

### Creating animated GIFS

- Size should be 1200px wide and 750px high (Or percentage thereof)

  Use the `tools\SetVSCodeWindow.ps1` script to help automatically set the size

- VS Code should be zoomed to +140%

  VS Code setting: `"window.zoomLevel": 2`

- Have blue border (Not required, but nice for consistency). This basically means use VS Code stable, not Insiders

- Use the latest VS Code edition

- Close explorer bar if it's not needed.  If it is needed keep the number of files shown to a minimum to avoid distraction _OR_ use a real life example (e.g. puppetlabs-stdlib)

- Reduce palette clutter where possible

  Disable extensions like Docker, Live Share etc. that add toolbar and status bar icons

- Probably best to use default font (not ligatures)

- Speed up frames to avoid users staring at a blank gif

- 10fps is probably a good frame rate to record at

  - Set it to looping

  - A good starting point is decrease the timing of all frames by 40ms

  - Set the last frame to 1000ms
