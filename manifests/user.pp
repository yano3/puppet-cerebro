# @summary Creates the cerebro user
#
# @api private
class cerebro::user
{
  if $cerebro::manage_user {
    user { $cerebro::cerebro_user:
      home  => '/opt/cerebro',
      shell => $cerebro::shell,
    }
  }
}
