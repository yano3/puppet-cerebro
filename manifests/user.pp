# Create the user to run services
class cerebro::user (
  $cerebro_user   = $cerebro::params::cerebro_user,
  $null_shell     = $cerebro::params::null_shell,
) inherits cerebro::params {
  user { $cerebro_user:
    home  => '/opt/cerebro',
    shell => $null_shell,
  }
}
