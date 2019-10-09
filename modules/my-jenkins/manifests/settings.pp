# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins::settings
class jenkins::settings inherits jenkins {

  file {$config_file:
    notify  => Service['jenkins'],
    ensure  => file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    content => template('jenkins/jenkins.erb'),
  }
}
