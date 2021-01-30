---
title: "Intellisense"
weight: 2
description: >
  Code completion, parameter info, quick info, member lists and more!
---

[IntelliSense](https://code.visualstudio.com/docs/editor/intellisense) is a general term for a variety of code editing features including: code completion, parameter info, quick info, and member lists. IntelliSense features are sometimes called by other names such as "code completion", "content assist", and "code hinting."

## Syntax Highlighting

Syntax highlighting recognizes all versions of Puppet and displays as you type.

- Puppet DSL
- Puppet Grammar
- Module metadata files

![syntax_highlighting]({{< static "img/syntax_highlighting.png" >}})

## Auto Completion

Auto complete Puppet types and classes and their parameter sets as you type. Tab completion works as you would expect.

![auto_complete]({{< static "img/auto_complete.gif" >}})

## Function Signatures

Get hints about the different ways you can call functions, also known as [function signatures](https://puppet.com/docs/puppet/latest/functions_ruby_signatures.html).

> Currently only a single signature will appear for Puppet Functions. When the the [`puppetstrings`](../experimental-features/#puppetstrings) feature flag is set, functions will show all available signatures, as it is in the example below.

![function_signatures]({{< static "img/signature_provider.gif" >}})

## Hover Support

Hovering over any resource, class declaration or other Puppet symbol provides instant contextual information. For example, hovering over the resource declaration lists the type name and parameter list, with all relevant help text.

![hover_support]({{< static "img/hover_support.gif" >}})

## Code Snippets

As part of [IntelliSense and Snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets), you can quickly create templates to automate repetitive series of code.

## Live Workspace Intellisense

If you are editing a module, or a [Control Repository](https://puppet.com/docs/pe/latest/control_repo.html), you will get live intellisense of the [Puppet Custom Types](https://puppet.com/docs/puppet/latest/custom_types.html), [Functions](https://puppet.com/docs/puppet/latest/lang_write_functions_in_puppet.html), [Classes](https://puppet.com/docs/puppet/latest/lang_classes.html) and [Defined Types](https://puppet.com/docs/puppet/latest/lang_defined_types.html). For example if you are editing the [puppetlabs-apache module](https://github.com/puppetlabs/puppetlabs-apache) you will be able to get auto-complete for resources like `apache::vhost` or `apache::mod::php`.

> Note: Workspace Intellisense is only updated when you save a file, instead of features like linting which update as you type
