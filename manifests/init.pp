class cerebro (
  Variant[Enum['stopped','running'], Boolean] $service_ensure = $::cerebro::params::service_ensure,
  Boolean          $service_enable = $::cerebro::params::service_enable,
  String           $version        = $::cerebro::params::version,
  String           $secret         = $::cerebro::params::secret,
  Array            $hosts          = $::cerebro::params::hosts,
  Variant[Pattern[/^\/$/],Stdlib::Unixpath] $basepath = $::cerebro::params::basepath,
  Stdlib::Unixpath $shell          = $::cerebro::params::shell,
  String           $cerebro_user   = $::cerebro::params::cerebro_user,
  Optional[String] $package_url    = $::cerebro::params::package_url,
  Array            $java_opts      = $::cerebro::params::java_opts,
  Optional[Stdlib::Unixpath] $java_home = $::cerebro::params::java_home,

  Optional[Hash] $basic_auth_settings = $::cerebro::params::basic_auth_settings,
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

  Class['cerebro::install']
  ~> Class['cerebro::service']
}
