class cerebro::install (
  $version     = $::cerebro::version,
  $user        = $::cerebro::cerebro_user,
  $package_url = $::cerebro::package_url,
) {
  $group = $user
  $real_package_url = pick($package_url, "https://github.com/lmenezes/cerebro/releases/download/v${version}/cerebro-${version}.zip")

  staging::deploy { "cerebro-${version}.zip":
    source => $real_package_url,
    target => '/opt',
  }

  file { '/opt/cerebro':
    ensure  => 'link',
    target  => "/opt/cerebro-${version}",
    require => Staging::Deploy["cerebro-${version}.zip"],
  }

  file { '/opt/cerebro/logs':
    ensure  => 'directory',
    owner   => $user,
    group   => $group,
    require => File['/opt/cerebro'],
  }

  file { '/var/log/cerebro':
    ensure => 'link',
    target => '/opt/cerebro/logs',
  }

  file { '/etc/cerebro':
    ensure => 'directory',
    owner  => $user,
    group  => $group,
  }

  file { '/var/cerebro':
    ensure => 'directory',
    owner  => $user,
    group  => $group,
  }

  file { '/var/run/cerebro':
    ensure => 'directory',
    owner  => $user,
    group  => $group,
  }

  file { '/etc/tmpfiles.d/cerebro.conf':
    content => template('cerebro/etc/tmpfiles.d/cerebro.conf.erb'),
  }

  file { '/etc/systemd/system/cerebro.service':
    content => template('cerebro/etc/systemd/system/cerebro.service.erb'),
  }

  exec { "systemd_reload_${title}":
    command     => '/usr/bin/systemctl daemon-reload',
    subscribe   => File['/etc/systemd/system/cerebro.service'],
    refreshonly => true,
  }
}
