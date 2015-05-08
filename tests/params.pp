# File::      <tt>params.pp</tt>
# Author::    UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   Gpl-3.0
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

include 'ULHPC/sysctl::params'

$names = ["ensure", "protocol", "port", "packagename"]

notice("ULHPC/sysctl::params::ensure = ${ULHPC/sysctl::params::ensure}")
notice("ULHPC/sysctl::params::protocol = ${ULHPC/sysctl::params::protocol}")
notice("ULHPC/sysctl::params::port = ${ULHPC/sysctl::params::port}")
notice("ULHPC/sysctl::params::packagename = ${ULHPC/sysctl::params::packagename}")

#each($names) |$v| {
#    $var = "ULHPC/sysctl::params::${v}"
#    notice("${var} = ", inline_template('<%= scope.lookupvar(@var) %>'))
#}
