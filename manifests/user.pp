class cerebro::user (
  $user  = $::cerebro::cerebro_user,
  $shell = $::cerebro::shell,
) {
  user { $user:
    home  => '/opt/cerebro',
    shell => $shell,
  }
}
