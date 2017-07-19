# Create the init script
class cerebro::service (
  $service_ensure = $cerebro::params::service_ensure,
  $service_enable = $cerebro::params::service_enable,
) inherits cerebro::params {
  service { 'cerebro':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
