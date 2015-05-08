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