# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins
class jenkins (

  ## Packages
  String $jenkins_version      = $jenkins::params::jenkins_version,
  String $fontconf_version     = $jenkins::params::fontconf_version,

  ## Services
  String $service_name         = $jenkins::params::service_name,
  Boolean $service_enable      = $jenkins::params::service_enable,
  String $service_ensure       = $jenkins::params::service_ensure,

  ## Conf Files
  Stdlib::Absolutepath $config_file    = $jenkins::params::config_file,
  String $repo_url              = $jenkins::params::repo_url,
  String $repo_key              = $jenkins::params::repo_key,

  ## settings
  Integer $http_port            = $jenkins::params::http_port,
  String $service_systemd       = $jenkins::params::service_systemd,

) inherits jenkins::params {

  # validate parameters here

  class { '::jenkins::config': }
  -> class { '::jenkins::install': }
  -> class { '::jenkins::settings': }
  ~> class { '::jenkins::service': }
  -> Class['::jenkins']
  }
