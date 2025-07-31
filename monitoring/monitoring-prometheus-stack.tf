resource "helm_release" "prometheus-stack" {
  count = 1
  name       = "prometheus-stack"
  chart      = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  version = "75.15.1"
  namespace = var.prometheus_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/prometheus-stack-values.yaml.tftpl", {
      hostname = var.grafana_hostname
      prometheus_url = "http://prometheus-server.monitoring.svc.cluster.local:80"
      prometheus_alert_url = "http://prometheus-alertmanager.monitoring.svc.cluster.local:80"
    })
  ]
}
