---
title: "Puppet Commands"
weight: 2
description: >
  Use Puppet commands from within VS Code!
---

## Puppet Resource

You can import existing resources directly using `puppet resource`

1. Open the command palette (`Ctrl+Shift+P`) or right click on a puppet file and select the menu entry

2. Type `puppet resource` and press enter

3. Enter the resource type you want to import, for example `user`

The information returned will be pasted into the open editor window where your cursor is resting, or at the begining of an empty file.

![puppet_resource]({{< static "img/puppet_resource.gif" >}})

You can change the notification message from the default message box, to a status bar notification or none at all, using the `puppet.notification.puppetResource` configuration setting.

## Puppet Node Graph preview

You can preview the [node graph](https://puppet.com/blog/visualize-your-infrastructure-models) of a manifest while you edit your Puppet Code.

1. Open the command palette (`Ctrl+Shift+P`) or right click on a puppet file and select the menu entry

2. Type `puppet open node`.. and press enter

The node graph will appear next to the manifest

![puppet_node_graph]({{< static "img/puppet_node_graph.gif" >}})

You can change the notification message from the default message box, to a status bar notification or none at all, using the `puppet.notification.nodeGraph` configuration setting.

TODO - explain the include problem
