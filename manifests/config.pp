class cerebro::config (
  $secret,
  $hosts,
) {
  file { '/etc/cerebro/application.conf':
    content => template('cerebro/etc/cerebro/application.conf.erb'),
  }
}
