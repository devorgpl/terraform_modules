resource "kubernetes_namespace_v1" "monitoring_namespace" {
  metadata {
    name = "monitoring"
  }
}

module "monitoring_prometheus" {
  source = "../../monitoring/prometheus"
  prometheus_namespace = kubernetes_namespace_v1.monitoring_namespace.metadata[0].name
  prometheus_enabled_count = 1
  prometheus_hostname = var.prometheus.prometheus_hostname
  grafana_hostname = var.prometheus.grafana_hostname
}

module "monitoring_openobserve" {
  source = "../../monitoring/openobserve"
  openobserve_namespace = kubernetes_namespace_v1.monitoring_namespace.metadata[0].name
  openobserve_hostname = var.openobserve.hostname
}
