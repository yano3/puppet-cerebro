class cerebro (
  $version        = '0.6.5',
  $service_ensure = 'running',
  $service_enable = true,
  $secret         = 'ki:s:[[@=Ag?QI`W2jMwkY:eqvrJ]JqoJyi2axj3ZvOv^/KavOT4ViJSv?6YY4[N',
  $hosts          = undef
) {

  $cerebro_user = 'cerebro'

  class { 'cerebro::user':
    user => $cerebro_user,
  } ->

  class { 'cerebro::install':
    user    => $cerebro_user,
    version => $version,
  } ->

  class { 'cerebro::config':
    secret  => $secret,
    hosts   => $hosts,
  } ~>

  class { 'cerebro::service':
    enable => $service_enable,
    ensure => $service_ensure,
  }
}
