#Create configuration
class cerebro::config (
  $secret = $cerebro::params::secret,
  $hosts = $cerebro::params::hosts,
  $basepath = $cerebro::params::basepath,
) inherits cerebro::params {
  file { '/etc/cerebro/application.conf':
    content => template('cerebro/etc/cerebro/application.conf.erb'),
  }
}
