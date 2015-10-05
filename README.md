-*- mode: markdown; mode: visual-line;  -*-

# Sysctl Puppet Module 

[![Puppet Forge](http://img.shields.io/puppetforge/v/ULHPC/sysctl.svg)](https://forge.puppetlabs.com/ULHPC/sysctl)
[![License](http://img.shields.io/:license-GPL3.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian|centos-lightgrey.svg)
[![Documentation Status](https://readthedocs.org/projects/ulhpc-puppet-sysctl/badge/?version=latest)](https://readthedocs.org/projects/ulhpc-puppet-sysctl/?badge=latest)

Configure and manage sysctl

      Copyright (c) 2015 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team <hpc-sysadmins@uni.lu>
      

| [Project Page](https://github.com/ULHPC/puppet-sysctl) | [Sources](https://github.com/ULHPC/puppet-sysctl) | [Documentation](https://ulhpc-puppet-sysctl.readthedocs.org/en/latest/) | [Issues](https://github.com/ULHPC/puppet-sysctl/issues) |

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

_Note_: the various operations that can be conducted from this repository are piloted from a [`Rakefile`](https://github.com/ruby/rake) and assumes you have a running [Ruby](https://www.ruby-lang.org/en/) installation.
See `docs/contributing.md` for more details on the steps you shall follow to have this `Rakefile` working properly. 

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

See also [`tests/init.pp`](tests/init.pp)

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

See also [`tests/init.pp`](tests/init.pp)

## Librarian-Puppet / R10K Setup

You can of course configure the sysctl module in your `Puppetfile` to make it available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ULHPC/sysctl"

or, if you prefer to work on the git version: 

     mod "ULHPC/sysctl", 
         :git => 'https://github.com/ULHPC/puppet-sysctl',
         :ref => 'production' 

## Issues / Feature request

You can submit bug / issues / feature request using the [ULHPC/sysctl Puppet Module Tracker](https://github.com/ULHPC/puppet-sysctl/issues). 

## Developments / Contributing to the code 

If you want to contribute to the code, you shall be aware of the way this module is organized. 
These elements are detailed on [`docs/contributing.md`](contributing/index.md).

You are more than welcome to contribute to its development by [sending a pull request](https://help.github.com/articles/using-pull-requests). 

## Puppet modules tests within a Vagrant box

The best way to test this module in a non-intrusive way is to rely on [Vagrant](http://www.vagrantup.com/).
The `Vagrantfile` at the root of the repository pilot the provisioning various vagrant boxes available on [Vagrant cloud](https://atlas.hashicorp.com/boxes/search?utf8=%E2%9C%93&sort=&provider=virtualbox&q=svarrette) you can use to test this module.

See [`docs/vagrant.md`](vagrant.md) for more details. 

## Online Documentation

[Read the Docs](https://readthedocs.org/) aka RTFD hosts documentation for the open source community and the [ULHPC/sysctl](https://github.com/ULHPC/puppet-sysctl) puppet module has its documentation (see the `docs/` directly) hosted on [readthedocs](http://ulhpc-puppet-sysctl.rtfd.org).

See [`docs/rtfd.md`](rtfd.md) for more details.

## Licence

This project and the sources proposed within this repository are released under the terms of the [GPL-3.0](LICENCE) licence.


[![Licence](https://www.gnu.org/graphics/gplv3-88x31.png)](LICENSE)
