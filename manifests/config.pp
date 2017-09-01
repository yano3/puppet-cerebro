class cerebro::config (
  $secret   = $::cerebro::secret,
  $hosts    = $::cerebro::hosts,
  $basepath = $::cerebro::basepath,
) {
  file { '/etc/cerebro/application.conf':
    content => template('cerebro/etc/cerebro/application.conf.erb'),
  }
}
