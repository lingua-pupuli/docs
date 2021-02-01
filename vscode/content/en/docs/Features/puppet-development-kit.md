---
title: "Puppet Development Kit"
weight: 2
description: >
  Built in Puppet Development Kit (PDK) commands
---

You can use the [Puppet Development Kit](https://puppet.com/blog/develop-modules-faster-new-puppet-development-kit) inside VS Code from the command palette.

To use any of these PDK commands, open the command palette and start typing a command.

You can also use the right-click context menu or the editor menu to reach these commands.

## Requirements

- A supported version of the Puppet Development Kit installed

## Integration

The Puppet VS Code Extension uses the PDK package to execute PDK commands. This means all commands are executed in a local shell by passing string commands.


## Supported PDK Commands

### PDK New Module

You can create new Puppet modules using the PDK and VS Code by using the `PDK: New Module`command. This is the same functionality as `pdk new module`.

You can execute the `PDK: New Module` command using the Puppet DAG icon in the upper right hand corner of the editor window, from the VS Code Command Palatte, or from a editor Context menu.

The `PDK: New Module` command is available even if the extension isn't loaded, so it can be used in an empty VS Code window or in a VS Code instance with a folder already opened.

> This command has limited usefullness in a session in the [Microsoft Remote Container Extension](https://code.visualstudio.com/docs/remote/containers), as it might not have access to the host filesystem path you desire.

![pdk_new_module]({{< static "img/pdk_new_module.gif" >}})

### PDK New Class

You can create new Puppet classes using the PDK and VS Code by using the `PDK: New Class`command. This VS Code command opens up an integrated VS Code terminal and issues the `pdk new class` command.

You can execute the `PDK: New Class` command using the the VS Code Command Palatte, or from a editor Context menu.

This command works well both in a regular VS Code session and in a [Microsoft Remote Container Extension](https://code.visualstudio.com/docs/remote/containers) or [Microsoft WSL Extension](https://code.visualstudio.com/docs/remote/wsl) session.

> Note: This command is only available when the Puppet VS Code Extension has loaded

![pdk_new_class]({{< static "img/pdk_new_class.gif" >}})

### PDK New Defined Type

You can create new Puppet classes using the PDK and VS Code by using the `PDK: New Defined Type`command. This VS Code command opens up an integrated VS Code terminal and issues the `pdk new defined_type` command.

You can execute the `PDK: New Defined Type` command using the the VS Code Command Palatte, or from a editor Context menu.

This command works well both in a regular VS Code session and in a [Microsoft Remote Container Extension](https://code.visualstudio.com/docs/remote/containers) or [Microsoft WSL Extension](https://code.visualstudio.com/docs/remote/wsl) session.

> Note: This command is only available when the Puppet VS Code Extension has loaded

![pdk_new_defined_type]({{< static "img/pdk_new_defined_type.gif" >}})

### PDK validate

You can validate your Puppet module using the PDK and VS Code by using the `PDK: Validate` command. This VS Code command opens up an integrated VS Code terminal and issues the `pdk new validate` command.

You can execute the `PDK: Validate` command using the the VS Code Command Palatte.

This command works well both in a regular VS Code session and in a [Microsoft Remote Container Extension](https://code.visualstudio.com/docs/remote/containers) or [Microsoft WSL Extension](https://code.visualstudio.com/docs/remote/wsl) session.

> Note: This command is only available when the Puppet VS Code Extension has loaded

![pdk_validate]({{< static "img/pdk_validate.gif" >}})

### PDK test unit


You can run the test suite of your Puppet module using the PDK and VS Code by using the `PDK: Test Unit` command. This VS Code command opens up an integrated VS Code terminal and issues the `pdk test unit` command.

You can execute the `PDK: Test Unit` command using the the VS Code Command Palatte.

> Note: This command is only available when the Puppet VS Code Extension has loaded

![pdk_test_unit]({{< static "img/pdk_test_unit.gif" >}})

## Unsupported PDK Commands

The following commands are not available in the command palette as they are complicated commands that require user input to succeed. It is better to use these from the VS Code terminal inside your workspace.

- `pdk build`
- `pdk bundle`
- `pdk config`
- `pdk convert`
- `pdk module`
- `pdk update`

## Supported PDK versions

The Puppet VS Code Extension supports the current PDK version, and one older version.

## Changing Puppet version used by VS Code

You can change the Puppet version used by the Puppet VS Code Extension and the PDK commands listed above. This is useful when targeting certain Puppet versions when writing manifests, or when running PDK commands with a specific Puppet version.

The version is changed using the status bar in Visual Studio Code. Click on the Puppet version text in the status bar and then select which Puppet version you would like to use. Note that this will require Visual Studio Code to be restarted to take effect.

![changing_puppet_version]({{< static "img/change-puppet-version.gif" >}})
