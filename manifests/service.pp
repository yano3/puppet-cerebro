class cerebro::service (
  $ensure = $::cerebro::service_ensure,
  $enable = $::cerebro::service_enable,
) {
  service { 'cerebro':
    ensure => $ensure,
    enable => $enable,
  }
}
