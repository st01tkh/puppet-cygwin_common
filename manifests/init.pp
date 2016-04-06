# == Class: cygwin_common
#
# Install CygWin
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'cygwin_common':
#  }
#
# === Authors
#
# st01tkh <st01tkh@gmail.com>
#
# === Copyright
#
# Copyright 2016 st01tkh
#
class cygwin_common {
  if ($operatingsystem == 'windows') {
    Package { provider => chocolatey, }
    package { 'cygwin': ensure => installed, } ->
    package { 'cyg-get': ensure => installed, } ->
    class {'cygwin_common::path' : } ->
    class {'cygwin_common::minimal' : }
  } else {
      notify {"$operatingsystem is not supported": }
  }
}
