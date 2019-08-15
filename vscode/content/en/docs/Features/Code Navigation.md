---
title: "Code Navigation"
weight: 2
description: >
  The power of an IDE and the speed of a text editor
---

## Outline View

The new `Outline View` shows the symbol tree of the currently selected Puppet manifest.

Supported symbols:

- Class
- Defined Type
- Attribute
- Variable

More symbols are planned to be added.

> Note: Outline View is supported on Puppet 5.0 and above

![outline_view]({{< static "img/outline_view.gif" >}})

## Breadcrumbs

When the `breadcrumbs.enabled` setting is set to true, both the file path and the symbol tree hierarchy are shown in the Breadcrumb view.

> Note: Breadcrumbs are supported on Puppet 5.0 and above

![breadcrumbs]({{< static "img/breadcrumbs.gif" >}})

## Go to Symbol

Opening the `Command Palette` and typing the `@` symbol initiates the `Go to Symbol` view which allows you to navigate around inside a Puppet manifest more quickly.

> Note: Go to Symbol is supported on Puppet 5.0 and above

![go_to_symbol]({{< static "img/go_to_symbol.gif" >}})

## Open Symbol by Name

Pressing `Ctrl+T` (or ⌘T on OSX) will list all [Puppet Custom Types](https://puppet.com/docs/puppet/latest/custom_types.html), [Functions](https://puppet.com/docs/puppet/latest/lang_write_functions_in_puppet.html), [Classes](https://puppet.com/docs/puppet/latest/lang_classes.html) and [Defined Types](https://puppet.com/docs/puppet/latest/lang_defined_types.html) in the workspace. You can then [navigate to the symbol](https://code.visualstudio.com/docs/editor/editingevolved#_open-symbol-by-name) by pressing `Enter`.

> Note: Open Symbol by Name has limited support using Puppet 4
