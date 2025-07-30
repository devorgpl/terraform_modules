resource "helm_release" "grafana" {
  count = var.grafana_enabled_count
  name       = "grafana"
  chart      = "oci://registry-1.docker.io/bitnamicharts/grafana"
  version = "12.1.2"
  namespace = var.grafana_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/grafana-values.yaml.tftpl", {
      hostname = var.grafana_hostname
      prometheus_url = "http://prometheus.monitoring.svc.cluster.local:9093"
      prometheus_alert_url = "http://prometheus-alertmanager.monitoring.svc.cluster.local:9093"
    })
  ]
}
