# File::      <tt>params.pp</tt>
# Author::    UL HPC Management Team <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   GPL-3.0
#
# ------------------------------------------------------------------------------
# You need the 'future' parser to be able to execute this manifest (that's
# required for the each loop below).
#
# Thus execute this manifest in your vagrant box as follows:
#
#      sudo puppet apply -t --parser future /vagrant/tests/params.pp
#
#

include 'sysctl::params'

$names = ['ensure', 'protocol', 'port', 'packagename']

notice("sysctl::params::ensure = ${sysctl::params::ensure}")
notice("sysctl::params::protocol = ${sysctl::params::protocol}")
notice("sysctl::params::port = ${sysctl::params::port}")
notice("sysctl::params::packagename = ${sysctl::params::packagename}")
