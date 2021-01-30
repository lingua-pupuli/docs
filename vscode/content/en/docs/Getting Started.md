---
title: "Getting Started"
weight: 1
description: >
  How to start using the Puppet VS Code Extension
---

## Quick Start

- Step 1: Install a supported version of the Puppet Development Kit on your system (see [Prerequisites](#prerequisites) for more information).

- Step 2: [Install](https://code.visualstudio.com/docs/editor/extension-gallery#_install-an-extension) the Puppet [extension](https://marketplace.visualstudio.com/items?itemName=puppet.puppet-vscode) for Visual Studio Code.

- Step 3: Open, or create, a Puppet manifest file (a file with a `.pp` or `.epp` extension) or a [`Puppetfile`](https://puppet.com/docs/pe/latest/puppetfile.html) and start automating!

## Prerequisites

You will need to have the [Puppet Agent](https://puppet.com/docs/puppet/4.10/about_agent.html) or [Puppet Development Kit (PDK)](https://puppet.com/docs/pdk/1.x/pdk.html) installed in order to fully use this extension.

You can find instructions and installation links here:

### PDK

> Note: PDK version 1.5.0 or higher is required.

- [Download page](https://puppet.com/download-puppet-development-kit)

### Puppet-Agent

> Note: Puppet Agent 5.5 and above is preferred.

- [Windows](https://puppet.com/docs/puppet/7.3/install_agents.html#install_windows_agents)

- [MacOSX](https://puppet.com/docs/puppet/7.3/install_agents.html#install_mac_agents)

- [Linux](https://puppet.com/docs/puppet/7.3/install_agents.html#install_nix_agents)

### Platform support

- Microsoft Windows
- MacOSX
- Linux

## Installation

The VS Code Marketplace has many extensions, including the Puppet Extension. To quickly install the Puppet Extension, click on the `Install` button at the top of this page.

You can install the official release of the Puppet extension by following the steps in the [Visual Studio Code documentation](https://code.visualstudio.com/docs/editor/extension-gallery). In the Extensions pane, search for `puppet-vscode` extension and install it there. You will get notified automatically about any future extension updates!

![extension_install]({{< static "img/extension_install.gif" >}})

You can also install the extension without access to the internet by following these [instructions](https://code.visualstudio.com/docs/editor/extension-gallery#_install-from-a-vsix).

## Setup

While the default configuration for the Puppet Extension will get you up and running quickly, you may want to tailor the configuration to your own liking. All of the available settings are detailed in the [Extension Settings](../extension-settings) documentation.
Now that you've installed the extension you may want configure

### Automatic configuration

By default the extension attempts to automatically find a valid installation of the PDK on your system. If a PDK installation is not found, it attempts to find a Puppet Agent installation. The locations it looks for are the default install locations for each product. Exact default values for these locations can be found in [Extension Settings](../extension-settings) documentation.

#### Configure extension to use PDK

To ensure that the extension uses the `PDK`, set the `puppet.installType` setting to the `pdk` value like so:

```json
{
  "puppet.installType":"pdk"
}
```

The default installation paths stored in the extension are:

Windows:

```json
{
  "puppet.installDirectory":"C:\\Program Files\\Puppet Labs\\DevelopmentKit"
}
```

OSX:

```json
{
  "puppet.installDirectory":"/opt/puppetlabs/pdk"
}
```

Linux:

```json
{
  "puppet.installDirectory":"/opt/puppetlabs/pdk"
}
```

To use a custom install path for the `PDK`, set the `puppet.installDirectory` setting to the path you installed the `PDK` to:

```json
{
  "puppet.installDirectory":"D:/programs/pdk"
}
```

#### Configure Puppet Version in PDK

The `PDK` has many versions of Puppet which can be used. Set the `puppet.editorService.puppet.version` setting to the version you would like to use, for example, if you wanted to use version 5.4.0, then set the configuration to:

```json
{
  "puppet.editorService.puppet.version":"5.4.0"
}
```

You can also change the version from the status bar in Visual Studio Code.  Click on the Puppet version text in the status bar and then select which Puppet version you would like to use. Note that this will require Visual Studio Code to be restarted to take effect.

![changing_puppet_version]({{< static "img/change-puppet-version.gif" >}})

#### Configure extension to use Puppet-Agent

To ensure that the extension uses the Puppet-Agent, set the `puppet.installType` setting to the `puppet` value like so:

```json
{
  "puppet.installType":"puppet"
}
```

The default installation paths stored in the extension are:

Windows:

```json
{
  "puppet.installDirectory":"C:\\Program Files\\Puppet Labs\\Puppet",
}
```

OSX

```json
{
  "puppet.installDirectory":"/opt/puppetlabs"
}
```

Linux:

```json
{
  "puppet.installDirectory":"/opt/puppetlabs"
}
```

To use a custom install path for the Puppet-Agent, set the `puppet.installDirectory` setting to the path you installed the Puppet-Agent to:

```json
{
  "puppet.installDirectory":"D:/programs/puppet"
}
```

### Loading indicator

The Puppet extension includes additional information in the form of a tooltip which describes the features that are loaded and still loading during startup.

![loading_status]({{< static "img/loading_status.gif" >}})
