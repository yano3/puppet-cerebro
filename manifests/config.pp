class cerebro::config (
  $secret,
) {
  file { '/etc/cerebro/application.conf':
    content => template('cerebro/etc/cerebro/application.conf'),
  }
}
