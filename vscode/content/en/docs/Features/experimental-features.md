---
title: "Experimental Features"
weight: 2
description: >
  Trying out new and experimental features of the extension
---

{{% alert title="Warning" color="warning" %}}
Experimental features may not always work and could cause the extension to crash, or behave in strange ways.
{{% /alert %}}

## Why use feature flags?

The Puppet VS Code extension changes quickly, and the maintainers would like to get new features into "your hands" as soon as possible. To make this possible experimental features are only turned on with the correct [feature flag](https://en.wikipedia.org/wiki/Feature_toggle).

You can enable feature flags using the `puppet.editorService.featureFlags` [setting](../../extension-settings/#puppet-editorservice-featureflags).

The following feature flags are available for use

## `puppetstrings`

``` json
puppet.editorService.featureFlags = ['puppetstrings']
```

Requirements:

- The Puppet Development Kit

- Puppet 6.0 and above

Uses [Puppet Strings](https://github.com/puppetlabs/puppet-strings) to generate the intellisense information, instead of the legacy (Puppet 3.x) techniques. Puppet Strings can enumerate [modern API Puppet Functions](https://puppet.com/docs/puppet/latest/functions_ruby_overview.html) and Puppet [Data Types](https://puppet.com/docs/puppet/latest/lang_data_type.html). This is part of the [Puppet 4 API and Puppet Agent 6 project](https://github.com/orgs/lingua-pupuli/projects/23).
