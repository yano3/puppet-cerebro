class cerebro::params {
  $version        = '0.6.6'
  $service_ensure = 'running'
  $service_enable = true
  $secret         = 'ki:s:[[@=Ag?QI`W2jMwkY:eqvrJ]JqoJyi2axj3ZvOv^/KavOT4ViJSv?6YY4[N' # The upstream default
  $hosts          = []
  $basepath       = '/'
  $cerebro_user   = 'cerebro'
  $package_url    = undef
  $shell = $facts['os']['family'] ? {
    'Debian' => '/usr/sbin/nologin',
    default  => '/sbin/nologin',
  }
  $java_opts      = []
  $java_home      = undef
}
