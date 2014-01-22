#
# == Class: ksplice
#
# Install and configure ksplice. This module depends on the "puppetlabs/apt"
# and "puppetlabs/stdlib" modules:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
# <https://forge.puppetlabs.com/puppetlabs/stdlib>
#
# == Parameters
#
# [*accesskey*]
#   The Ksplice Uptrack access key for this host.
# [*proxy_url*]
#   The proxy URL used for fetching the ksplice software repository public 
#   keys. For example "http://proxy.domain.com:8888". Not needed if the node has 
#   direct Internet connectivity, or if you're installing ksplice from your 
#   operating system repositories. Defaults to 'none' (do not use a proxy).
#
# == Examples
#
# include ksplice
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-lisence
# See file LICENSE for details
#
class ksplice
(
    $accesskey,
    $proxy_url = 'none',
)
{
# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_ksplice', 'true') != 'false' {

    class { 'ksplice::softwarerepo':
        proxy_url => $proxy_url,
    }

    include ksplice::install

    class { 'ksplice::config':
        accesskey => $accesskey,
        proxy_url => $proxy_url,
    }
}
}
