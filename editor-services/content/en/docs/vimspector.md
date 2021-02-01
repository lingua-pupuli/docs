# Using puppet-editor-services with Vim

Vim has a debugging interface plugin called
[https://github.com/puremourning/vimspector](vimspector) that uses the
[https://microsoft.github.io/debug-adapter-protocol/](Debugger Adapter
Protocol) for communicating with language servers.

It is thus possible to integrate vimspector with puppet-editor-services to
debug puppet catalog compilation for manifests.

This document shows how to integrate vimspector with puppet-editor-services
once you already have the vimspector plugin installed. Please refer to the
plugin's README file for instructions on how to install it.

Note that this document shows the same information as is present in
vimspector's wiki, but with more verbose instructions:

https://github.com/puremourning/vimspector/wiki/languages#puppet

## Create a gadget installer file

First, we'll create a file that tells vimspector how to download and install
puppet-adapter-services and also how to run it. This file needs to be located
under the vimspector plugin directory:

    vimspector$ mkdir -p gadgets/custom
    vimspector$ cat > gadgets/custom/cust_puppet-debugserver.json <<EOF
    {
      "puppet-debugserver":  {
        "download": {
          "url": "https://github.com/puppetlabs/puppet-editor-services/releases/download/${version}/${file_name}"
        },
        "all": {
          "version": "1.0.1",
          "file_name": "puppet_editor_services_1.0.1.zip",
          "checksum": "15b33bf63062f226466191d4417368a411f6a14f53c67d4898ca488a8b22454b",
          "adapters": {
            "cust_puppet-debugserver": {
              "command": [
                "ruby",
                "${gadgetDir}/cust_puppet-debugserver/puppet-debugserver",
                "--port",
                "${unusedLocalPort}"
              ],
              "configuration": {
                "cwd": "${workspaceRoot}"
              },
              "name": "puppet-debugserver",
              "port": "${unusedLocalPort}"
            }
          }
        }
      }
    }
    EOF

## Download puppet-debugserver

Now we can make vimspector download the debugserver in a place where it will be
able to find it. Open up Vim and run the following command:

    :VimspectorInstall

## Configure debug runs in your project

In your project (so for example in your control repository), configure how the
debugger opens files:

    {
      "configurations": {
        "launch current file": {
          "adapter": "cust_puppet-debugserver",
          "configuration": {
            "request": "launch",
            "manifest": "${file}",
            "noop": true,
            "args": [ 
              "--modulepath",
              "/path/to/your/modules"
            ]
          }
        }
      }
    }

The example above always starts debugging on the currently opened file. This
tactic is not the best since most manifests define a class or a defined type
but don't instantiate them, so it's really just an example to show how the file
should look like. You can change the value of the `manifest` option to
something that would be more meaningful in your case. See the following section
for more information about which files are more useful for debugging than
others.

## Start debugging

Now you can start debugging! However, there are some considerations to keep in
mind:

* What you are asking `puppet-debugserver` to debug is the catalog
  compilation. This means that you need your manifests to actually instantiate
  some resources. So you will need some test file that includes a role, a
  profile or a module element that you want to debug. For example if you want
  to debug the defined type `apt:setting` from the `puppetlabs/apt` module,
  you would have a file with a content like the following:

    apt::setting { 'needrestart':
      content  => 'DPkg::Pre-Install-Pkgs {"/usr/bin/apt-listbugs apt";};',
      priority => 5,
    }

* `puppet-debugserver` currently doesn't have the ability to stop on entry. So
  before starting a debugging session, you should set at least one breakpoint
  somewhere in the code.

