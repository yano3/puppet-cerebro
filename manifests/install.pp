class cerebro::install (
  $version,
  $user,
) {
  $group = $user
  $package_url = "https://github.com/lmenezes/cerebro/releases/download/v${version}/cerebro-${version}.zip"

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
    owner  => $user,
    group  => $group,
  } ->

  file { '/var/log/cerebro':
    ensure => 'link',
    target => "/opt/cerebro/logs",
  }

  file { '/etc/cerebro':
    ensure => 'directory',
    owner  => $user,
    group  => $group,
  } ->

  file { '/etc/cerebro/application.conf':
    content => template('cerebro/etc/cerebro/application.conf'),
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
    content => template('cerebro/etc/tmpfiles.d/cerebro.conf'),
  }

  file { '/etc/systemd/system/cerebro.service':
    content => template('cerebro/etc/systemd/system/cerebro.service'),
  }

  exec { "systemd_reload_${title}":
    command     => '/usr/bin/systemctl daemon-reload',
    subscribe   => File['/etc/systemd/system/cerebro.service'],
    refreshonly => true,
  }
}
