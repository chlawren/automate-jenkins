# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include firewall_rules::config
class firewall_rules::config {

  firewall { "100 user defined rules":
    action => 'accept',
    state  => 'NEW',
    dport  => '8140,22,123,53',
    proto  => 'tcp',
  }
}
