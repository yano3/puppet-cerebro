class cerebro (
  $version        = $::cerebro::params::version,
  $service_ensure = $::cerebro::params::service_ensure,
  $service_enable = $::cerebro::params::service_enable,
  $secret         = $::cerebro::params::secret,
  $hosts          = $::cerebro::params::hosts,
  $basepath       = $::cerebro::params::basepath,
  $cerebro_user   = $::cerebro::params::cerebro_user,
  $package_url    = $::cerebro::params::package_url,
  $shell          = $::cerebro::params::shell,
) inherits cerebro::params {

  if $secret == $::cerebro::params::secret {
    notify { 'Default is being used for $::cerebro::secret.  It is highly recommended to change this value before running cerebro in production.':}
  }

  contain '::cerebro::user'
  contain '::cerebro::install'
  contain '::cerebro::config'
  contain '::cerebro::service'

  Class['cerebro::user']
  -> Class['cerebro::install']
  -> Class['cerebro::config']
  ~> Class['cerebro::service']
}
