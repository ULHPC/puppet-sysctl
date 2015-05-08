# File::      <tt>sysctl.pp</tt>
# Author::    Hyacinthe Cartiaux (hyacinthe.cartiaux@uni.lu)
# Copyright:: Copyright (c) 2011 Hyacinthe Cartiaux
# License::   GPLv2
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
#     import sysctl
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
        debian, ubuntu:         { include sysctl::debian }
        redhat, fedora, centos: { include sysctl::redhat }
        default: {
            fail("Module $::{module_name} is not supported on $::{operatingsystem}")
        }
    }
}

# ------------------------------------------------------------------------------
# = Class: sysctl::common
#
# Base class to be inherited by the other sysctl classes
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class sysctl::common {

    # Load the variables used in this module. Check the sysctl-params.pp file
    require sysctl::params


    if ($sysctl::ensure == 'absent')
    {
        exec { "mv -f ${sysctl::params::configfile}.orig ${sysctl::params::configfile}":
            path   => '/usr/bin:/usr/sbin:/bin',
            user   => $sysctl::params::configfile_owner,
            group  => $sysctl::params::configfile_group,
            onlyif => "test -f ${sysctl::params::configfile}.orig",
        }
    }
    else
    {

        file { 'sysctl.conf':
            ensure => $sysctl::ensure,
            path   => $sysctl::params::configfile,
            owner  => $sysctl::params::configfile_owner,
            group  => $sysctl::params::configfile_group,
            mode   => $sysctl::params::configfile_mode,
        }

        exec { 'create_sysctl_origfile':
            path    => '/usr/bin:/usr/sbin:/bin',
            command => "cp ${sysctl::params::configfile} ${sysctl::params::configfile}.orig",
            creates => "${sysctl::params::configfile}.orig",
            user    => $sysctl::params::configfile_owner,
            group   => $sysctl::params::configfile_group,
            unless  => "test -f ${sysctl::params::configfile}.orig",
        }
    }

}


# ------------------------------------------------------------------------------
# = Class: sysctl::debian
#
# Specialization class for Debian systems
class sysctl::debian inherits sysctl::common { }

# ------------------------------------------------------------------------------
# = Class: sysctl::redhat
#
# Specialization class for Redhat systems
class sysctl::redhat inherits sysctl::common { }



