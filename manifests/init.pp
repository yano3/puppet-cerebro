# @summary Installs and configures Cerebro
#
# @see https://github.com/lmenezes/cerebro
#
# @example Basic usage
#   include cerebro
#
# @example Installing a specific version
#   class { 'cerebro':
#     version => '0.8.1',
#   }
#
# @param version
#  Defines the Cerebro version.
# @param service_ensure
#  Determines whether the cerebro service should be running.
# @param service_enable
#  Determines whether the cerebro service should be enabled when the system is booted.
# @param secret
#  Specifies the secret string used to sign session cookies etc.
# @param hosts
#  Defines an array of known hosts hashes.
# @param basepath
#  Specifies the application base path.
# @param shell
#  Specifies a shell for the cerebro user.
# @param manage_user
#  Determines whether to creating the user that the cerebro process is executed as.
# @param cerebro_user
#  Specifies the user that cerebro process is executed as.
# @param package_url
#  Defines a package location for downloading cerebro.
# @param java_opts
#  Defines the `JAVA_OPTS` variables.
# @param java_home
#  Defines the `JAVA_HOME` path.
# @param basic_auth_settings
#  Defines basic authentication settings.
# @param address
#  Defines the IP address cerebro should listen on.
class cerebro (
  Stdlib::Ensure::Service $service_ensure = $cerebro::params::service_ensure,
  Boolean          $service_enable = $cerebro::params::service_enable,
  String[1]        $version        = $cerebro::params::version,
  String           $secret         = $cerebro::params::secret,
  Array[Struct[{
    host => Stdlib::HTTPUrl,
    name => String[1]
  }]]                 $hosts          = $cerebro::params::hosts,
  Variant[Pattern[/^\/$/],Stdlib::Unixpath] $basepath = $cerebro::params::basepath,
  Stdlib::Unixpath    $shell          = $cerebro::params::shell,
  String[1]           $cerebro_user   = $cerebro::params::cerebro_user,
  Boolean             $manage_user    = $cerebro::params::manage_user,
  Optional[String[1]] $package_url    = $cerebro::params::package_url,
  Array[String[1]]           $java_opts  = $cerebro::params::java_opts,
  Optional[Stdlib::Unixpath] $java_home  = $cerebro::params::java_home,
  Optional[Hash] $basic_auth_settings    = $cerebro::params::basic_auth_settings,
  Optional[Stdlib::IP::Address] $address = $cerebro::params::address,
) inherits cerebro::params {

  contain cerebro::user
  contain cerebro::install
  contain cerebro::config
  contain cerebro::service

  Class['cerebro::user']
  -> Class['cerebro::install']
  -> Class['cerebro::config']
  ~> Class['cerebro::service']

  Class['cerebro::install']
  ~> Class['cerebro::service']
}
