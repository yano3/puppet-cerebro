class cerebro::config (
  $secret              = $::cerebro::secret,
  $hosts               = $::cerebro::hosts,
  $basepath            = $::cerebro::basepath,
  $java_home           = $::cerebro::java_home,
  $java_opts           = $::cerebro::java_opts,
  $basic_auth_settings = $::cerebro::basic_auth_settings,
  $sysconfig           = $::cerebro::sysconfig
) {
  file { '/etc/cerebro/application.conf':
    ensure  => file,
    content => template('cerebro/etc/cerebro/application.conf.erb'),
  }
  file { $sysconfig:
    ensure  => file,
    mode    => '0644',
    content => template('cerebro/etc/sysconfig/cerebro.erb'),
  }
}
