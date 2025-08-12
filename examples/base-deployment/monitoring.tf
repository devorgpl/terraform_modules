module "monitoring_prometheus" {
  source = "../../monitoring/prometheus"
  prometheus_namespace = "monitoring"
  prometheus_enabled_count = 1
  prometheus_hostname = var.prometheus_hostname
  grafana_hostname = var.grafana_hostname
}

module "monitoring_openobserve" {
  source = "../../monitoring/openobserve"
  openobserve_namespace = "monitoring"
  openobserve_hostname = var.openobserve_hostname
}
