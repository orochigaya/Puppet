require 'spec_helper'

describe 'apache::mod::perl', type: :class do
  it_behaves_like 'a mod class, without including apache'
  context 'on a Debian OS' do
    let :facts do
      {
        osfamily: 'Debian',
        operatingsystemrelease: '8',
        lsbdistcodename: 'jessie',
        operatingsystem: 'Debian',
        id: 'root',
        kernel: 'Linux',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        is_pe: false,
      }
    end

    it { is_expected.to contain_class('apache::params') }
    it { is_expected.to contain_apache__mod('perl') }
    it { is_expected.to contain_package('libapache2-mod-perl2') }
  end
  context 'on a RedHat OS' do
    let :facts do
      {
        osfamily: 'RedHat',
        operatingsystemrelease: '6',
        operatingsystem: 'RedHat',
        id: 'root',
        kernel: 'Linux',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        is_pe: false,
      }
    end

    it { is_expected.to contain_class('apache::params') }
    it { is_expected.to contain_apache__mod('perl') }
    it { is_expected.to contain_package('mod_perl') }
  end
  context 'on a FreeBSD OS' do
    let :facts do
      {
        osfamily: 'FreeBSD',
        operatingsystemrelease: '9',
        operatingsystem: 'FreeBSD',
        id: 'root',
        kernel: 'FreeBSD',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        is_pe: false,
      }
    end

    it { is_expected.to contain_class('apache::params') }
    it { is_expected.to contain_apache__mod('perl') }
    it { is_expected.to contain_package('www/mod_perl2') }
  end
  context 'on a Gentoo OS' do
    let :facts do
      {
        osfamily: 'Gentoo',
        operatingsystemrelease: '3.16.1-gentoo',
        operatingsystem: 'Gentoo',
        id: 'root',
        kernel: 'Linux',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin',
        is_pe: false,
      }
    end

    it { is_expected.to contain_class('apache::params') }
    it { is_expected.to contain_apache__mod('perl') }
    it { is_expected.to contain_package('www-apache/mod_perl') }
  end
end
