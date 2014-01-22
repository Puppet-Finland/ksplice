#
# == Class: ksplice::softwarerepo
#
# Setup Ksplice Uptrack apt repository. This class depends on the 
# "puppetlabs/apt" puppet module:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
#
class ksplice::softwarerepo
(
    $proxy_url
)
{

    if $::operatingsystem == 'Ubuntu' {

        apt::key { 'ksplice-aptrepo':
            key               => 'B6D4038E',
            key_source        => 'https://www.ksplice.com/apt/ksplice-archive.asc',
            key_options       => $proxy_url ? {
                'none'        => undef,
                default       => "http-proxy=\"$proxy_url\"",
            },
        }

        apt::source { 'ksplice-aptrepo':
            location          => 'http://www.ksplice.com/apt',
            release           => "${::lsbdistcodename}",
            repos             => 'ksplice',
            required_packages => undef,
            pin               => '501',
            include_src       => true,
            require => Apt::Key['ksplice-aptrepo'],
        }
    }
}
