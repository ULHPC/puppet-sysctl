-*- mode: markdown; mode: visual-line;  -*-

# Sysctl Puppet Module 

[![Puppet Forge](http://img.shields.io/puppetforge/v/ULHPC/sysctl.svg)](https://forge.puppetlabs.com/ULHPC/sysctl)
[![License](http://img.shields.io/:license-gpl3.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)

Configure and manage sysctl

      Copyright (c) 2015 UL HPC Management Team <hpc-sysadmins@uni.lu>
      

* [Online Project Page](https://github.com/ULHPC/sysctl)  -- [Sources](https://github.com/ULHPC/sysctl) -- [Issues](https://github.com/ULHPC/sysctl/issues)

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
    - `sysctl::value` 

All these components are configured through a set of variables you will find in
[`manifests/params.pp`](manifests/params.pp). 

_Note_: the various operations that can be conducted from this repository are piloted from a [`Rakefile`](https://github.com/ruby/rake) and assumes you have a running [Ruby](https://www.ruby-lang.org/en/) installation.
See [`doc/contributing.md`](doc/contributing.md) for more details on the steps you shall follow to have this `Rakefile` working properly. 

## Dependencies

See [`metadata.json`](metadata.json). In particular, this module depends on 

* [puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)

## Overview and Usage

### Class `sysctl`

This is the main class defined in this module.
It accepts the following parameters: 

* `$ensure`: default to 'present', can be 'absent'

Use is as follows:

     include ' sysctl'

See also [`tests/init.pp`](tests/init.pp)

### Class `sysctl::common`

See [`tests/common.pp`](tests/common.pp)
### Class `sysctl::common::debian`

See [`tests/common/debian.pp`](tests/common/debian.pp)
### Class `sysctl::common::redhat`

See [`tests/common/redhat.pp`](tests/common/redhat.pp)
### Class `sysctl::params`

See [`tests/params.pp`](tests/params.pp)

### Definition `sysctl::value`

The definition `sysctl::value` provides ...
This definition accepts the following parameters:

* `$ensure`: default to 'present', can be 'absent'
* `$content`: specify the contents of the directive as a string
* `$source`: copy a file as the content of the directive.

Example:

        sysctl::value { 'toto':
		      ensure => 'present',
        }

See also [`tests/value.pp`](tests/value.pp)


## Librarian-Puppet / R10K Setup

You can of course configure the sysctl module in your `Puppetfile` to make it available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ULHPC/sysctl"

or, if you prefer to work on the git version: 

     mod "ULHPC/sysctl", 
         :git => https://github.com/ULHPC/sysctl,
         :ref => production 

## Issues / Feature request

You can submit bug / issues / feature request using the [ULHPC/sysctl Puppet Module Tracker](https://github.com/ULHPC/sysctl/issues). 

## Developments / Contributing to the code 

If you want to contribute to the code, you shall be aware of the way this module is organized. 
These elements are detailed on [`doc/contributing.md`](doc/contributing.md)

You are more than welcome to contribute to its development by [sending a pull request](https://help.github.com/articles/using-pull-requests). 

## Puppet modules tests within a Vagrant box

The best way to test this module in a non-intrusive way is to rely on [Vagrant](http://www.vagrantup.com/).
The `Vagrantfile` at the root of the repository pilot the provisioning various vagrant boxes available on [Vagrant cloud](https://atlas.hashicorp.com/boxes/search?utf8=%E2%9C%93&sort=&provider=virtualbox&q=svarrette) you can use to test this module.

See [`doc/vagrant.md`](doc/vagrant.md) for more details. 


