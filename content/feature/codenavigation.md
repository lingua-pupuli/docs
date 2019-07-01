---
title: "Code Navigation"
subtitle: "The power of an IDE and the speed of a text editor"
date: 2019-06-06T13:56:42-04:00
pre: "fa-road"
---

## Outline View

The new `Outline View` shows the symbol tree of the currently selected Puppet manifest.

Supported symbols:

- Class
- Defined Type
- Attribute
- Variable

More symbols are planned to be added.

> Note: Puppet 4 is not supported for symbols

![outline_view](https://raw.githubusercontent.com/lingua-pupuli/puppet-vscode/master/docs/assets/outline_view.gif)

## Breadcrumbs

When the `breadcrumbs.enabled` setting is set to true, both the file path and the symbol tree hierarchy are shown in the Breadcrumb view.

> Note: Puppet 4 is not supported for symbols

![breadcrumbs](https://raw.githubusercontent.com/lingua-pupuli/puppet-vscode/master/docs/assets/breadcrumbs.gif)

## Go to Symbol

Opening the `Command Palette` and typing the `@` symbol initiates the `Go to Symbol` view which allows you to navigate around inside a Puppet manifest more quickly.

> Note: Puppet 4 is not supported

![go_to_symbol](https://raw.githubusercontent.com/lingua-pupuli/puppet-vscode/master/docs/assets/go_to_symbol.gif)

## Open Symbol by Name

Pressing `Ctrl+T` (or ⌘T on OSX) will list all [Puppet Custom Types](https://puppet.com/docs/puppet/latest/custom_types.html), [Functions](https://puppet.com/docs/puppet/latest/lang_write_functions_in_puppet.html), [Classes](https://puppet.com/docs/puppet/latest/lang_classes.html) and [Defined Types](https://puppet.com/docs/puppet/latest/lang_defined_types.html) in the workspace. You can then [navigate to the symbol](https://code.visualstudio.com/docs/editor/editingevolved#_open-symbol-by-name) by pressing `Enter`.

> Note: Puppet 4 has limited support
