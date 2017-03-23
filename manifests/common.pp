# File::      <tt>common.pp</tt>
# Author::    UL HPC Management Team <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   GPLv3
# ------------------------------------------------------------------------------
# = Class: sysctl::common
#
# Base class to be inherited by the other sysctl classes
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class sysctl::common {

    # Load the variables used in this module. Check the sysctl-params.pp file
    require sysctl::params

    file { 'sysctl.d':
        ensure => 'directory',
        path   => $sysctl::params::configdir,
        owner  => $sysctl::params::configdir_owner,
        group  => $sysctl::params::configdir_group,
        mode   => $sysctl::params::configdir_mode,
    }

}
