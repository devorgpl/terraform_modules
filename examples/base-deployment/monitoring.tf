module "monitoring_prometheus" {
  source = "../../monitoring/prometheus"
  prometheus_namespace = "monitoring"
  prometheus_enabled_count = 1
}

module "monitoring_openobserve" {
  source = "../../monitoring/openobserve"
  openobserve_namespace = "monitoring"
  openobserve_hostname = "openobserve.172.31.65.109.nip.io"
}
