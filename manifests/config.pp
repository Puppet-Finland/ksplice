#
# == Class: ksplice::config
#
# Configure ksplice
#
class ksplice::config
(
    $accesskey,
    $proxy_url
)
{
    file { 'ksplice-uptrack.conf':
        ensure => present,
        name => '/etc/uptrack/uptrack.conf',
        content => template('ksplice/uptrack.conf.erb'),
        owner => root,
        group => adm,
        mode => 640,
    }

}
