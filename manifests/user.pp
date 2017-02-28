class cerebro::user (
  $user,
) {
  user { $user:
    home  => '/opt/cerebro',
    shell => '/sbin/nologin',
  }
}
