class cerebro::params {
  $version        = '0.8.3'
  $address        = undef
  $service_ensure = 'running'
  $service_enable = true
  $secret         = extlib::cache_data('cerebro_cache_data', 'cerebro_secret', extlib::random_password(32))
  $hosts          = []
  $basepath       = '/'
  $cerebro_user   = 'cerebro'
  $manage_user    = true
  $package_url    = undef
  $shell = $facts['os']['family'] ? {
    'Debian' => '/usr/sbin/nologin',
    default  => '/sbin/nologin',
  }
  $java_opts      = []
  $java_home      = undef
  $basic_auth_settings = undef
  $sysconfig = $::osfamily ? {
    'Debian' => '/etc/default/cerebro',
    default  => '/etc/sysconfig/cerebro',
  }
}
