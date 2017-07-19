# Main class
class cerebro::params {
  $version        = '0.6.5'
  $service_ensure = 'running'
  $service_enable = true
  $secret         = undef #Please specify a key
  $hosts          = undef
  $basepath       = '/'
  $cerebro_user   = 'cerebro'
  $package_url    = "https://github.com/lmenezes/cerebro/releases/download/v${version}/cerebro-${version}.zip"
  if $facts[os][family] == 'Debian' {
    $null_shell   = '/usr/sbin/nologin'
  } else {
    $null_shell   ='/sbin/nologin'
  }
}
