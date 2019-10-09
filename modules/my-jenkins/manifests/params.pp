# @summary A short summary of the purpose of this class
#
# set the environment variables for jenkins 
#
# @example
#   include jenkins
class jenkins::params {

  case $::osfamily {
    'RedHat': {
      $service_name      = 'jenkins'
      $jenkins_version   = '2.190.1-1.1'
      $fontconf_version  = '2.13.0-4.3.el7'
      $service_enable    = true
      $service_ensure    = 'running'
      $repo_url          = 'http://pkg.jenkins-ci.org/redhat-stable'
      $repo_key          = 'https://jenkins-ci.org/redhat/jenkins-ci.org.key'
      $config_file       = '/etc/sysconfig/jenkins'
      $http_port         = 8000
      $service_systemd   = 'systemd'
      }
  default: {
    fail("${::operatingsystem} not supported")
    }
  }
}
