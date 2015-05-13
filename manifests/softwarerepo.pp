#
# == Class: ksplice::softwarerepo
#
# Setup Ksplice Uptrack apt repository. This class depends on the 
# "puppetlabs/apt" puppet module:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
#
class ksplice::softwarerepo {

    if $::operatingsystem == 'Ubuntu' {

        apt::source { 'ksplice-aptrepo':
            location => 'http://www.ksplice.com/apt',
            release  => $::lsbdistcodename,
            repos    => 'ksplice',
            pin      => '501',
            key      => {
                'id'     => '5DE2D4F255E23055D3C40F2CF7CA6265B6D4038E',
                'source' => 'https://www.ksplice.com/apt/ksplice-archive.asc',
            },
            include  => {
                'deb' => true,
            }
        }
    }
}
