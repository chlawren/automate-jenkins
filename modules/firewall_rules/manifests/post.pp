# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include firewall_rules::post
class firewall_rules::post {

     firewall { '999 drop all':
       proto  => 'all',
       action => 'drop',
       before => undef,
     }
}
