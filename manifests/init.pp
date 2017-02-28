class cerebro (
  $version        = '0.5.1',
  $service_ensure = 'running',
  $service_enable = true,
) {

  $cerebro_user = 'cerebro'

  class { 'cerebro::user':
    user => $cerebro_user,
  } ->

  class { 'cerebro::install':
    user    => $cerebro_user,
    version => $version,
  } ~>

  class { 'cerebro::service':
    enable => $service_enable,
    ensure => $service_ensure,
  }
}
