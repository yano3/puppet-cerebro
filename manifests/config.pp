class cerebro::config (
  $secret      = $::cerebro::secret,
  $hosts       = $::cerebro::hosts,
  $basepath    = $::cerebro::basepath,
  $java_home   = $::cerebro::java_home,
  $java_opts   = $::cerebro::java_opts,
) {
  file { '/etc/cerebro/application.conf':
    ensure  => file,
    content => template('cerebro/etc/cerebro/application.conf.erb'),
  }
  file { '/etc/sysconfig/cerebro':
    ensure  => file,
    mode    => '0644',
    content => template('cerebro/etc/sysconfig/cerebro.erb'),
  }
}
