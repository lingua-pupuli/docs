---
title: "Experiencing a Problem?"
weight: 10
description: >
  What to do if something goes wrong 😢
---

The extension is quite resilient but sometimes, something goes wrong. The following sections hope to address some common issues, and if those don't work, how to give the maintainers the most amount of information so it can be fixed quickly.

### Puppet Agent Install

A commonly encountered problem is not having the PDK or Puppet Agent installed on the computer you are running VSCode on. As noted in the [Prerequisites section]({{< ref "/docs/Getting Started#prerequisites" >}}), you will need to have the PDK or Puppet Agent installed in order to fully use this extension, as the extension uses the Puppet binaries and the Ruby language bundled into the PDK or agent install in order to function.

If you are receiving an error right after opening a Puppet file saying that a Puppet Agent install could not be found, ensure that Puppet is installed on the system. The VSCode extension attempts to find a valid Puppet install if a path is not configured in `puppet.installDirectory` in `User Settings`, so if Puppet is installed but not in a default path please check that your setting points to the correct path.

### Reloading the Puppet VSCode extension

If you haven't see the Problems Pane update in awhile, or hover and intellisense doesn't seem to showing up, and you might not know what to do. Sometimes the Puppet extension can experience problems which cause the language server to crash or not respond. The extension has a way of logging the crash, but there is something you can do to get right back to working: reload the Puppet Language Server.

You can reload the Puppet Language Server by opening the command palette and starting to type `Reload`. A list of commands will appear, select `Reload Window`. This will reload the Visual Studio Code window without closing down the entire editor, and without losing any work currently open in the editor.

## Reporting Problems

If you're having trouble with the Puppet extension, please follow these instructions
to file an issue on our GitHub repository:

### 1. File an issue on our [Issues Page](https://github.com/puppetlabs/puppet-vscode/issues)

Make sure to fill in the information that is requested in the issue template as it
will help us investigate the problem more quickly.

### 2. Capture verbose logs and send them to us

If you're having an issue with crashing or other erratic behavior, add the following
line to your User Settings in Visual Studio Code:

```json
    "puppet.editorService.loglevel": "debug",
    "puppet.editorService.debugFilePath": "C:\\Some\\file\\path.txt"
```

Restart Visual Studio Code and try to reproduce the problem, then examine the log. If the issue persists please open an issue and add both the content of the `Output` pane as well as the content in the log file. Please inspect the log and be sure to redact any information you would not want posted publicly.
