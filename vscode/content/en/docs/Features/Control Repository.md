---
title: "Control Repositories"
weight: 2
description: >
  Intellisense for control repositories
---

{{% alert title="More features coming soon" color="success" %}}
Under active development!!

Many more [Control Repository](https://puppet.com/docs/pe/latest/control_repo.html) features will be added
{{% /alert %}}

## Puppetfile validation

Quickly see validation errors in your [Puppetfile](https://puppet.com/docs/pe/2019.2/puppetfile.html), such as duplicate module definitions.

When [`puppet.validate.resolvePuppetfiles`](../../extension-settings/#puppet-validate-resolvepuppetfiles) is enabled, the validation will also include:

* Module dependencies will be evaluated to make sure that the versions are correct and that the dependencies can actually be resolved.

* The modules listed in the Puppetfile will also be validated that they are supported for the Puppet version being used by the extension. You can change the Puppet version using the [Change Puppet version feature](../../features/puppet-development-kit/#changing-puppet-version-used-by-vs-code).

![a_Puppetfile_with_validation_errors]({{< static "img/puppetfile-resolver.gif" >}})

> Note: The first time you open a Puppetfile, or add a module to a Puppetfile, validation may take longer than usual. This is expected for Puppet Forge modules that have many releases, such as the [Stdlib module](https://forge.puppet.com/puppetlabs/stdlib)
>
> The extended validation uses the [Puppetfile-Resolver](https://github.com/lingua-pupuli/puppetfile-resolver) project and has some caveats. Please see the [Known Issues](https://github.com/lingua-pupuli/puppetfile-resolver#known-issues) of Puppetfile-Resolver project more information
