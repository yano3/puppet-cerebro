# Main class
class cerebro (
  String $version        = $cerebro::params::version,
  $service_ensure = $cerebro::params::service_ensure,
  $service_enable = $cerebro::params::service_enable,
  String $secret         = $cerebro::params::secret,
  Array $hosts           = $cerebro::params::hosts,
  String $basepath       = $cerebro::params::basepath,
  String $user           = $cerebro::params::cerebro_user,

) inherits cerebro::params {

  class { 'cerebro::user':
    cerebro_user  => $user,
  } ->

  class { 'cerebro::install':
    cerebro_user => $user,
    version      => $version,
  } ->

  class { 'cerebro::config':
    secret   => $secret,
    hosts    => $hosts,
    basepath => $basepath,
  } ~>

  class { 'cerebro::service':
    service_enable => $service_enable,
    service_ensure => $service_ensure,
  }
}
