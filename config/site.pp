Exec {
  path => [ '/bin', '/usr/bin', '/usr/local/bin' ],
  cwd  => '/',
}

resources { 'firewall':
   purge => true,
  }

Firewall {
  before  => Class['firewall_rules::post'],
  require => Class['firewall_rules::pre'],
}

class { ['firewall_rules::pre', 'firewall_rules::post']: }
class { 'firewall': }
class { 'ntp': }

node 'jenkins' {

  class { '::puppet': server => false }
  class { '::jenkins': port => 8000 }

}

node 'puppetmaster' {

class { '::puppet': server => true }

}
