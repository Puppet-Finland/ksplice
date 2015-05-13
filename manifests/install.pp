#
# == Class: ksplice::install
#
# Install ksplice
#
class ksplice::install {

    package { 'ksplice-uptrack':
        ensure  => installed,
        name    => 'ksplice',
        require => Class['ksplice::softwarerepo'],
    }

}
