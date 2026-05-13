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
  $ensure = 'present'

  #### MODULE INTERNAL VARIABLES  #########
  # (Modify to adapt to unsupported OSes)
  #######################################

  $cmdname = $facts['os']['name'] ? {
    default => '/sbin/sysctl',
  }

  $configdir = $facts['os']['name'] ? {
    default => '/etc/sysctl.d',
  }
  $configdir_mode = $facts['os']['name'] ? {
    default => '0755',
  }
  $configdir_owner = $facts['os']['name'] ? {
    default => 'root',
  }
  $configdir_group = $facts['os']['name'] ? {
    default => 'root',
  }

  $configfile_mode = $facts['os']['name'] ? {
    default => '0644',
  }
  $configfile_owner = $facts['os']['name'] ? {
    default => 'root',
  }
  $configfile_group = $facts['os']['name'] ? {
    default => 'root',
  }
}
