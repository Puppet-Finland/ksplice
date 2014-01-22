#
# == Class: ksplice::install
#
# Install ksplice
#
class ksplice::install {

    package { 'ksplice-uptrack':
        name => 'ksplice',
        ensure => installed,
        require => Class['ksplice::softwarerepo'],
    }

}
