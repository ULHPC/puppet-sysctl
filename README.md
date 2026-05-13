# Sysctl Puppet Module

[![Puppet Forge](http://img.shields.io/puppetforge/v/ULHPC/sysctl.svg)](https://forge.puppetlabs.com/ULHPC/sysctl)
[![License](http://img.shields.io/:license-GPL3.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian|centos-lightgrey.svg)

Configure and manage sysctl

      Copyright (c) 2026 UL HPC Team <hpc-sysadmins@uni.lu>


| [Project Page](https://github.com/ULHPC/puppet-sysctl) | [Sources](https://github.com/ULHPC/puppet-sysctl) | [Issues](https://github.com/ULHPC/puppet-sysctl/issues) |

## Synopsis

Configure and manage sysctl.

This module implements the following elements:

* __Puppet classes__:
    - `sysctl`
    - `sysctl::common`
    - `sysctl::common::debian`
    - `sysctl::common::redhat`
    - `sysctl::params`

* __Puppet definitions__:
    - `sysctl::value: set a kernel parameter with sysctl

All these components are configured through a set of variables you will find in
[`manifests/params.pp`](manifests/params.pp).

## Dependencies

See [`metadata.json`](metadata.json). In particular, this module depends on

* [puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)

## Overview and Usage

### Class `sysctl`

This is the main class defined in this module.
It accepts the following parameters:

* `$ensure`: default to 'present', can be 'absent'

Use it as follows:

     include ' sysctl'

### Definition `sysctl::value`

The definition `sysctl::value` provides a way to define a kernel parameter with sysctl.
This definition accepts the following parameters:

* `$ensure`: default to 'present' (will create or update the value), can be 'absent' (will remove the parameter)
* `value`: set the kernel parameter (in sysctl.conf and with sysctl)

Examples:

Set a tunable such that the kernel does not reboot automatically if a node panics:

        sysctl::value { 'kernel.panic':
		      ensure => 'present',
		      value  => 0
        }


Unset the tunable (reset to default):

        sysctl::value { 'kernel.panic':
		      ensure => 'absent'
        }

## Librarian-Puppet / R10K Setup

You can of course configure the sysctl module in your `Puppetfile` to make it available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ULHPC/sysctl"

or, if you prefer to work on the git version:

     mod "ULHPC/sysctl",
         :git => 'https://github.com/ULHPC/puppet-sysctl',
         :ref => 'main'

## Developments / Issues / Contributing to the code

This Puppet Module has been implemented in the context of the [UL HPC](http://hpc.uni.lu) Platform of the [University of Luxembourg](http://www.uni.lu).
It relies on [Vox Pupuli modulesync](https://github.com/voxpupuli/modulesync) for its organization.

You can submit bugs / issues / feature requests using the [ULHPC/sysctl Puppet Module Tracker](https://github.com/ULHPC/puppet-sysctl/issues).
You are more than welcome to contribute to its development by [sending a pull request](https://help.github.com/articles/using-pull-requests).

## Licence

This project and the sources proposed within this repository are released under the terms of the [GPL-3.0](LICENCE) licence.


[![Licence](https://www.gnu.org/graphics/gplv3-88x31.png)](LICENSE)
