---
title: "Extension Settings"
weight: 2
description: >
  How do you configure the extension
github_repo: "" # Disable the edit commands
---

You can configure [User and Workspace VS Code settings](https://code.visualstudio.com/docs/getstarted/settings) for the Puppet Extension, like any other VS Code setting. The table below lists all of the available settings for the Puppet Extension

{{% alert title="Information" color="secondary" %}}
The setting information comes from the Puppet VS Code Extension [`package.json`](https://github.com/puppetlabs/puppet-vscode/blob/master/package.json) file. If you would
like to make changes, please create a project issue.
{{% /alert %}}

## Available settings

<!-- Begin Available Settings -->
#### puppet.editorService.debugFilePath

The absolute filepath where the Puppet Editor Service will output the debugging log. By default no logfile is generated

#### puppet.editorService.enable

Enable/disable advanced Puppet Language Features

Default: `True`

#### puppet.editorService.featureFlags

An array of strings of experimental features to enable in the Puppet Editor Service

#### puppet.editorService.foldingRange.enable

Enable/disable syntax aware code folding provider

Default: `True`

#### puppet.editorService.foldingRange.showLastLine

Show or hide the last line in code folding regions

#### puppet.editorService.formatOnType.enable

Enable/disable the Puppet document on-type formatter, for example hashrocket alignment

#### puppet.editorService.formatOnType.maxFileSize

Sets the maximum file size (in Bytes) that document on-type formatting will occur. Setting this to zero (0) will disable the file size check. Note that large file sizes can cause performance issues.

Default: `4096`

#### puppet.editorService.hover.showMetadataInfo

Enable or disable showing Puppet Module version information in the metadata.json file

Default: `True`

#### puppet.editorService.loglevel

Set the logging verbosity level for the Puppet Editor Service, with Debug producing the most output and Error producing the least

Possible values: `debug`, `error`, `normal`, `warning`, `verbose`

Default: `normal`

#### puppet.editorService.protocol

The protocol used to communicate with the Puppet Editor Service. By default the local STDIO protocol is used.

Possible values: `stdio`, `tcp`

Default: `stdio`

#### puppet.editorService.puppet.confdir

The Puppet configuration directory. See https://puppet.com/docs/puppet/latest/dirs_confdir.html for more information

#### puppet.editorService.puppet.environment

The Puppet environment to use. See https://puppet.com/docs/puppet/latest/config_print.html#environments for more information

#### puppet.editorService.puppet.modulePath

Additional module paths to use when starting the Editor Services. On Windows this is delimited with a semicolon, and on all other platforms, with a colon. For example C:\Path1;C:\Path2

#### puppet.editorService.puppet.vardir

The Puppet cache directory. See https://puppet.com/docs/puppet/latest/dirs_vardir.html for more information

#### puppet.editorService.puppet.version

The version of Puppet to use. For example '5.4.0'. This is generally only applicable when using the PDK installation type. If Puppet Editor Services is unable to use this version, it will default to the latest available version of Puppet.

#### puppet.editorService.tcp.address

The IP address or hostname of the remote Puppet Editor Service to connect to, for example 'computer.domain' or '192.168.0.1'. Only applicable when the editorService.protocol is set to tcp

#### puppet.editorService.tcp.port

The TCP Port of the remote Puppet Editor Service to connect to. Only applicable when the editorService.protocol is set to tcp

#### puppet.editorService.timeout

The timeout to connect to the Puppet Editor Service

Default: `10`

#### puppet.format.enable

Enable/disable the Puppet document formatter

Default: `True`

#### puppet.installDirectory

The fully qualified path to the Puppet install directory. This can be a PDK or Puppet Agent installation. For example: 'C:\Program Files\Puppet Labs\Puppet' or '/opt/puppetlabs/puppet'. If this is not set the extension will attempt to detect the installation directory. Do **not** use when `#puppet.installType#` is set to `auto`

#### puppet.installType

The type of Puppet installation. Either the Puppet Development Kit (pdk) or the Puppet Agent (agent). Choose `auto` to have the extension detect which to use automatically based on default install locations

Possible values: `auto`, `pdk`, `agent`

Default: `auto`

#### puppet.notification.nodeGraph

The type of notification used when a node graph is being generated. Default value of messagebox

Possible values: `messagebox`, `statusbar`, `none`

Default: `messagebox`

#### puppet.notification.puppetResource

The type of notification used when a running Puppet Resouce. Default value of messagebox

Possible values: `messagebox`, `statusbar`, `none`

Default: `messagebox`

#### puppet.pdk.checkVersion

Enable/disable checking if installed PDK version is latest

Default: `True`

#### puppet.titleBar.pdkNewModule.enable

Enable/disable the PDK New Module icon in the Editor Title Bar

Default: `True`

#### puppet.validate.resolvePuppetfiles

Enable/disable using dependency resolution for Puppetfiles

Default: `True`


<!-- End Available Settings -->

## Deprecated settings

<!-- Begin Deprecated Settings -->

<!-- End Deprecated Settings -->

