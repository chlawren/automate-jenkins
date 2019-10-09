# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include firewall_rules::pre
class firewall_rules::pre {

  Firewall {
    require => undef,
  }
     firewall { '000 accept all icmp':
       proto  => 'icmp',
       action => 'accept',
     }
     firewall { '001 accept all to lo interface':
       proto   => 'all',
       iniface => 'lo',
       action  => 'accept',
     }
     firewall { '002 reject local traffic not on loopback interface':
       iniface     => '! lo',
       proto       => 'all',
       destination => '127.0.0.1/8',
       action      => 'reject',
     }
     firewall { '003 accept related established rules':
       proto  => 'all',
       state  => ['RELATED', 'ESTABLISHED'],
       action => 'accept',
     }
     firewall { '004 accept user defined ports':
       dport    => [22,123,80,443,8140,53],
       proto    => tcp,
       action   => accept,
     }
}
