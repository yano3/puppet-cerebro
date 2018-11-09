# @summary Manages Cerebro service
#
# @api private
class cerebro::service
{
  if $facts['os']['name'] == 'Amazon' {
    service { 'cerebro':
      ensure  => $cerebro::service_ensure,
      enable  => $cerebro::service_enable,
      restart => '/etc/init.d/cerebro restart',
      start   => '/etc/init.d/cerebro start',
      status  => '/etc/init.d/cerebro status',
      stop    => '/etc/init.d/cerebro stop',
    }
  } else {
    service { 'cerebro':
      ensure => $cerebro::service_ensure,
      enable => $cerebro::service_enable,
    }
  }
}
