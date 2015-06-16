# == Class: mono
#
class mono(
  $manage_repo = $::mono::params::manage_repo,
) inherits mono::params {

  if $manage_repo {
    require mono::repo
    Class[mono::repo] -> Package[$::mono::params::package_name]
  }

  package { $::mono::params::package_name:
    ensure => present,
  }
}
