---
title: "Puppet Bolt"
weight: 2
description: >
  Reach out and manage your systems with tasks and plans
---

{{% alert title="Warning" color="warning" %}}
This is an experimental feature
{{% /alert %}}

Support for Puppet Bolt was added in version 0.17.0 of the Puppet VS Code Extension. Fully supporting an end to end Puppet Bolt editing experience is a multi-step process, so this is experimental for now.

The first step in this is enabling parsing Bolt Plans. This means when opening a Puppet module with Puppet Bolt plans or a folder with a Puppet Bolt plan file the Puppet VSCode Extension will no longer log an error in the Problems Pane for failing to parse Puppet Bolt Plan keywords. You will get symbol support (OutlineView and Breadcrumbs) as well as syntax highlighting. Subsequent releases will focus on adding intellisense, autocompletion, hover support and other advanced editor features. This work is tracked in the [Puppet Bolt Support Github project](https://github.com/orgs/lingua-pupuli/projects/20)

#### Puppet Bolt Commands and Snippets

We have added support for VSCode Command Palette commands for opening Bolt user config and inventory YAML files. We have also added support for YAML snippets for common operations in Bolt YAML files.

![bolt_command_palette]({{< static "img/bolt_config_command.gif" >}})

![bolt_command_palette]({{< static "img/bolt_inventory_command.gif" >}})
