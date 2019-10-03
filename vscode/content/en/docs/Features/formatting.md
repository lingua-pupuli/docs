---
title: "Formatting"
weight: 2
description: >
  Formatting your Puppet manifests
---

VS Code has great support for source [code formatting](https://code.visualstudio.com/docs/editor/codebasics#_formatting). You can invoke the formatting commands from the Command Palette (Ctrl+Shift+P) or the editor context menu.

The Puppet VS Code extension supports; Format the line while typing and Format a file on save.

## Format While You Type

{{% alert title="Information" color="secondary" %}}

- This feature is disabled by default, both by VS Code and the Puppet Extension.  It can be enabled using the [`puppet.editorService.formatOnType.enable`](../../extension-settings/#puppet-editorservice-formatontype-enable) and [`editor.formatOnType`](https://code.visualstudio.com/docs/getstarted/settings#_default-settings) settings

- Formatting will not occur on large documents (> 4KB) or when using tabs for indentation
{{% /alert %}}

### Hash Rocket Alignment

Automatically align hash rockets (also known as arrows or fat commas) when typing. The alignment happens with you type `>`.

![hash_rocket_alignment]({{< static "img/hash_rocket_alignment.gif" >}})

## Format Document

The `Format Document` (`Shift+Alt+F` or ⇧⌥F) command automatically fixes any linting errors using the equivalent of [`puppet-lint --fix`](https://github.com/rodjek/puppet-lint#fix-issues-automatically). See the [puppet-lint](http://puppet-lint.com/checks/) documentation for information about the available checks.

{{% alert title="Information" color="secondary" %}}

- This feature is enabled by default and can be disabled using the [`puppet.format.enable`](../../extension-settings/#puppet-format-enable) setting
{{% /alert %}}

![format_document]({{< static "img/format_document.gif" >}})

### Format on Save

VS Code can automatically apply any formatting fixes every time you save the document. You can enable this feature with the `editor.formatOnSave` [setting](https://code.visualstudio.com/docs/getstarted/settings#_default-settings).

![format_on_save]({{< static "img/format_on_save.gif" >}})
