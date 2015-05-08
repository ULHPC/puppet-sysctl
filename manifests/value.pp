# File::      <tt>sysctl-set_value.pp</tt>
# Author::    UL HPC Management Team <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   GPLv3
# ------------------------------------------------------------------------------
# = Define: sysctl::set_value
#
# Defines kernel parameter with sysctl. You are intended to use as name the
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

  if ($ensure == 'present')
  {
      exec { "exec_sysctl_${parameter}":
          command => "${sysctl::params::cmdname} ${name}=${value}",
      }

      # First insert of the parameter
      exec { "echo ${parameter}=${value} >> ${sysctl::params::configfile}":
          path    => '/usr/bin:/usr/sbin:/bin',
          unless  => "grep '^${parameter}[[:blank:]]*=.*$' ${sysctl::params::configfile}",
          require => Exec['create_sysctl_origfile']
      }

      # Change value of the parameter if already existing
      exec { "sed -s -i 's/^${parameter}[[:blank:]]*=.*$/${parameter}=${value}/' ${sysctl::params::configfile}":
          path    => '/usr/bin:/usr/sbin:/bin',
          unless  => "grep '^${parameter}[[:blank:]]*=${value}$' ${sysctl::params::configfile}",
          require => Exec['create_sysctl_origfile']
      }
  }
  else
  {
      # Delete the parameter
      exec { "sed -s -i '/^${parameter}[[:blank:]]*=.*$/d' ${sysctl::params::configfile}":
          path    => '/usr/bin:/usr/sbin:/bin',
      }
  }

}

