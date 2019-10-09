class jenkins::service inherits jenkins {

  service {'jenkins':
    ensure     => $service_ensure,
    enable     => $service_enable,
    provider   => $service_systemd,
    hasstatus  => true,
    hasrestart => true,
  }
}
