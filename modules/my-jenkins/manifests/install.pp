# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins
class jenkins::install {

  package { 'jenkins': ensure => $::jenkins::jenkins_version }
  package { 'fontconfig': ensure => $::jenkins::fontconf_version }
}
