# Install Cerebro
class cerebro::install (
  $version        = $cerebro::params::version,
  $service_ensure = $cerebro::params::service_ensure,
  $service_enable = $cerebro::params::service_enable,
  $secret         = $cerebro::params::secret,
  $hosts          = $cerebro::params::hosts,
  $basepath       = $cerebro::params::basepath,
  $cerebro_user   = $cerebro::params::cerebro_user,
  $package_url    = $cerebro::params::package_url,
) inherits cerebro::params {

  $group = $cerebro_user


  staging::deploy { "cerebro-${version}.zip":
    source => $package_url,
    target => '/opt',
  } ->

  file { '/opt/cerebro':
    ensure => 'link',
    target => "/opt/cerebro-${version}",
  } ->

  file { '/opt/cerebro/logs':
    ensure => 'directory',
    owner  => $cerebro_user,
    group  => $group,
  } ->

  file { '/var/log/cerebro':
    ensure => 'link',
    target => '/opt/cerebro/logs',
  }

  file { '/etc/cerebro':
    ensure => 'directory',
    owner  => $cerebro_user,
    group  => $group,
  }

  file { '/var/cerebro':
    ensure => 'directory',
    owner  => $cerebro_user,
    group  => $group,
  }

  file { '/var/run/cerebro':
    ensure => 'directory',
    owner  => $cerebro_user,
    group  => $group,
  }

  file { '/etc/tmpfiles.d/cerebro.conf':
    content => template('cerebro/etc/tmpfiles.d/cerebro.conf.erb'),
  }

  file { '/etc/systemd/system/cerebro.service':
    content => template('cerebro/etc/systemd/system/cerebro.service.erb'),
  }

  exec { "systemd_reload_${title}":
    command     => 'systemctl daemon-reload',
    subscribe   => File['/etc/systemd/system/cerebro.service'],
    refreshonly => true,
    path        => [ '/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin', '/snap/bin', '/snap/bin', '/opt/puppetlabs/bin' ],
  }
}
