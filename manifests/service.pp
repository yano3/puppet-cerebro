class cerebro::service (
  $enable,
  $ensure,
) {
  service { 'cerebro':
    enable => $enable,
    ensure => $ensure,
  }
}
