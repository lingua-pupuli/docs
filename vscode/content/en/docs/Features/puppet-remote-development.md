---
title: "Remote Puppet Development"
weight: 2
description: >
  Editing Puppet wherever you need to
---

{{% alert title="Coming Soon" color="success" %}}
Containers, WSL and Docker

Under active development!!
{{% /alert %}}

# Remote Puppet Development in Containers

The [Puppet Extension](https://marketplace.visualstudio.com/items?itemName=jpogran.puppet-vscode) and the [Microsoft Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension lets you use a Docker container as a full-featured Puppet development environment. Whether you deploy to containers or not, containers make a great development environment because you can:

- Develop with a consistent, easily reproducible toolchain on the same operating system you deploy to.
- Quickly swap between different, isolated development environments and safely make updates without worrying about impacting your local machine.
- Make it easy for new team members / contributors to get up and running in a consistent development environment.
- Try out new technologies or clone a copy of a code base without impacting your local setup.

## Installing Prerequisites

You will need Visual Studio Code, the [Microsoft Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension, and Docker Desktop installed. A guided [walkthrough](https://code.visualstudio.com/remote-tutorials/containers/getting-started) is available from the Visual Studio code docs site.

https://puppet.com/download-puppet-development-kit
https://puppet.com/docs/pdk/1.x/pdk_install.html

## Setting up your Workspace

1. Open a Puppet module in VS Code
1. Click on the green icon in the lower left corner and select `Remote-Containers: Add Development Container Configuration Files...`. This can also be done in the VS Code Command Palette
1. Either start typing `puppet` or scroll down to the `Puppet Development Kit - Dockerfile` entry and select it
1. Click on the green icon in the lower left corner and select `Remote-Containers: Reopen in Container`. This can also be done in the VS Code Command Palette
1. VS Code will reload the current window, then pop an information message that it's builing an image from the Dockerfile. Clicking on the details button or using a keyboard shortcut to open the terminal window shows the progress of this action.

At this point you have everything configured in order to start developing Puppet code, but what does that mean?

The `Puppet Development Kit - Dockerfile` entry is a template that adds two files to your open workspace: a `devecontainer.json` file and a `Dockerfile`. More information on what a `devcontainer.json` file is and what it does is [here](https://code.visualstudio.com/remote-tutorials/containers/how-it-works#_devcontainerjson), but for the purposes of this document, it it the file that contains the information needed in order to setup a Docker container environment for Puppet development use. The `Dockerfile` creates a Docker image that has the Puppet Development Kit installed.

## Using the Puppet Extension in a Container Environment

If you start to open files or use the integrated terminal, you'll see that you are no longer 'working' in the host operating system, but inside the Docker container you just built and started. In this case, it is based off the Docker `ruby:2` tag, and installs a few gems as well as the PDK. It's a large docker image, but it's meant to have alot of tools ready to use. You can choose to customize image further, or use the official PDK Docker image `puppet/pdk`. See [using the PDK docker conainter](#pdk-docker-container) for more info on that.

- Open a puppet manifest, see syntax highlighting and intellisense, outlineview, etc
- Open command palette, see all puppet and pdk commands, see them used
- Creating/editing files gets reflected in host os filesystem

{{% alert title="Coming Soon" color="success" %}}
Containers, WSL and Docker

Under active development!!
{{% /alert %}}

# Remote Puppet Development in Windows Subsystem for Linux

## Installing Prerequisites

You will need Visual Studio Code, WSL and a Linux distro installed. A guided [walkthrough](https://code.visualstudio.com/remote-tutorials/wsl/getting-started) is available from the Visual Studio code docs site.

## Installing the Puppet Extension and PDK

https://puppet.com/download-puppet-development-kit
https://puppet.com/docs/pdk/1.x/pdk_install.html

## Using the Puppet Extension in WSL
