# == Class: mono::repo
#
# This class is considered private.
#
class mono::repo {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  rpmkey { 'D3D831EF':
    ensure => present,
    source => 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
  } ->
  # this is the repo name created by running:
  # yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
  # per the instructions @
  # http://www.mono-project.com/docs/getting-started/install/linux/#usage
  yumrepo { 'download.mono-project.com_repo_centos_':
    ensure   => 'present',
    baseurl  => 'http://download.mono-project.com/repo/centos/',
    descr    => 'added from: http://download.mono-project.com/repo/centos/',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
  }
}
