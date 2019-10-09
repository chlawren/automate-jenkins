# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins
class jenkins::config {

  yumrepo {'jenkins-repo':
    descr    => 'Jenkins Repository',
    baseurl  => $::jenkins::repo_url,
    gpgcheck => 1,
    gpgkey   => $::jenkins::repo_key,
    enabled  => 1,
  }

  file {'/etc/systemd/system/jenkins.service/':
    ensure => present,
    mode   => '0755',
    source => "puppet:///modules/jenkins/jenkins.service",
  }

  firewall { "100 allow Jenkins Port":
    action => 'accept',
    state  => 'NEW',
    dport  => $::jenkins::http_port,
    proto  => 'tcp',
  }
}
