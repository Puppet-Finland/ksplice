#
# == Class: ksplice
#
# Install and configure ksplice. This module depends on the "puppetlabs/apt"
# and "puppetlabs/stdlib" modules:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
# <https://forge.puppetlabs.com/puppetlabs/stdlib>
#
# WARNING: Oracle has bastardized ksplice for platforms other than "Oracle 
# Unbreakable Linux". The Ubuntu version of ksplice pulls with it tons of 
# desktop dependencies, thus rendering it useless on servers. Circumventing 
# these restrictions would probably violate the kpslice EULA. Therefore this 
# module is pretty much useless and available here only for reference.
#
# == Parameters
#
# [*accesskey*]
#   The Ksplice Uptrack access key for this host.
# [*proxy_url*]
#   The proxy URL used with ksplice. For example "http://proxy.domain.com:8888". 
#   Not needed if the node has direct Internet connectivity, or if you're 
#   installing ksplice from your operating system repositories. Defaults to 
#   'none' (do not use a proxy).
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
    $proxy_url = 'none'
)
{
# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_ksplice', 'true') != 'false' {

    include ksplice::softwarerepo
    include ksplice::install

    class { 'ksplice::config':
        accesskey => $accesskey,
        proxy_url => $proxy_url,
    }
}
}
