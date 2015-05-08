# File::      <tt>params.pp</tt>
# Author::    UL HPC Management Team <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   GPL v3
#
# ------------------------------------------------------------------------------
# = Class: sysctl::params
#
# In this class are defined as variables values that are used in other
# sysctl classes.
# This class should be included, where necessary, and eventually be enhanced
# with support for more OS
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# The usage of a dedicated param classe is advised to better deal with
# parametrized classes, see
# http://docs.puppetlabs.com/guides/parameterized_classes.html
#
# [Remember: No empty lines between comments and class definition]
#
class sysctl::params {

    $ensure = $::sysctl_ensure ? {
        ''      => 'present',
        default => $::sysctl_ensure
    }

    #### MODULE INTERNAL VARIABLES  #########
    # (Modify to adapt to unsupported OSes)
    #######################################

    $cmdname = $::operatingsystem ? {
        default => '/sbin/sysctl',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/sysctl.conf',
    }

    $configfile_mode = $::operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $::operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $::operatingsystem ? {
        default => 'root',
    }
}

