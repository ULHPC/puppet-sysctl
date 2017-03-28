# File::      <tt>value.pp</tt>
# Author::    UL HPC Management Team <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   GPLv3
# ------------------------------------------------------------------------------
# = Define: sysctl::value
#
# Defines kernel parameter with sysctl. You should use as name the actual
# name of the parameter.
#
# == Parameter:
#
# [*ensure*]:
#   Present/Absent (default: $sysctl::ensure)
#
# [*value*]:
#   Value of the parameter
#
# = Usage:
#
#          sysctl::value { "net.bridge.bridge-nf-call-iptables":
#                value => '0'
#          }
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# [Remember: No empty lines between comments and class definition]
#
define sysctl::value(
    $value,
    $ensure = $sysctl::params::ensure
)
{

    include sysctl::params
    include sysctl::common

    $parameter = $name

    if ($ensure == 'present') {
        exec { "exec_sysctl_${parameter}":
            command     => "${sysctl::params::cmdname} ${name}=${value}",
            subscribe   => File["${parameter}.conf"],
            refreshonly => true
        }
    }

    file { "${parameter}.conf":
        ensure  => $ensure,
        path    => "${sysctl::params::configdir}/${parameter}.conf",
        owner   => $sysctl::params::configfile_owner,
        group   => $sysctl::params::configfile_group,
        mode    => $sysctl::params::configfile_mode,
        content => "${parameter}=${value}",
        require => File[$sysctl::params::configdir]
    }

}

