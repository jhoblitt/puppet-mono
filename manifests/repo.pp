# == Class: mono::repo
#
# This class is considered private.
#
class mono::repo {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  rpmkey { '5FF054BD':
    ensure => present,
    source => 'https://swdl.mono.com/repos/mono/bjn-key',
  } ->
  yumrepo { 'mono':
    ensure   => 'present',
    baseurl  => 'https://swdl.mono.com/repos/mono/x86_64/release/rpm',
    descr    => 'Blue Jeans Network, Inc. - x86_64 software and updates',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://swdl.mono.com/repos/mono/bjn-key',
  }
}
