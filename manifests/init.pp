# File::      <tt>init.pp</tt>
# Author::    UL HPC Management Team <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Class: sysctl
#
# Configure and manage sysctl
#
# == Parameters:
#
# $ensure:: *Default*: 'present'. Ensure the presence (or absence) of sysctl
#
# == Actions:
#
# Install and configure sysctl
#
# == Requires:
#
# n/a
#
# == Sample Usage:
#
#     include sysctl
#
# You can then specialize the various aspects of the configuration,
# for instance:
#
#         class { 'sysctl':
#             ensure => 'present'
#         }
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
#
# [Remember: No empty lines between comments and class definition]
#
class sysctl( $ensure = $sysctl::params::ensure ) inherits sysctl::params
{
    info ("Configuring sysctl (with ensure = ${ensure})")

    if ! ($ensure in [ 'present', 'absent' ]) {
        fail("sysctl 'ensure' parameter must be set to either 'absent' or 'present'")
    }

    case $::operatingsystem {
        debian, ubuntu:         { include sysctl::common::debian }
        redhat, fedora, centos: { include sysctl::common::redhat }
        default: {
            fail("Module $::{module_name} is not supported on $::{operatingsystem}")
        }
    }
}
