# == Class: mono::params
#
# This class is considered private.
#
class mono::params {

  case $::osfamily {
    'RedHat': {
      $manage_repo  = true
      $package_name = 'mono-complete'
    }
    default: {
      fail("${::osfamily} is not supported")
    }
  }
}
