class cerebro::params {
  $version        = '0.6.6'
  $service_ensure = 'running'
  $service_enable = true
  $secret         = cache_data('cerebro_cache_data', 'cerebro_secret', random_password(32))
  $hosts          = []
  $basepath       = '/'
  $cerebro_user   = 'cerebro'
  $package_url    = undef
  $shell = $::osfamily ? {
    'Debian' => '/usr/sbin/nologin',
    default  => '/sbin/nologin',
  }
  $java_opts      = []
  $java_home      = undef
  $basic_auth_settings = undef
}
