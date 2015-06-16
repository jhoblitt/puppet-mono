require 'spec_helper_acceptance'

describe 'mono class' do
  describe 'running puppet code' do
    pp = <<-EOS
      if $::osfamily == 'RedHat' {
        class { 'epel': } -> Class['mono']
      }

      include ::mono
    EOS

    it 'applies the manifest twice with no stderr' do
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('mono-complete') do
      it { should be_installed }
    end

    describe yumrepo('download.mono-project.com_repo_centos_') do
      it { should be_enabled }
    end
  end
end
