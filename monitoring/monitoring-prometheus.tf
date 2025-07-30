resource "helm_release" "prometheus" {
  count = var.prometheus_enabled_count
  name       = "prometheus"
  chart      = "oci://registry-1.docker.io/bitnamicharts/prometheus"
  version = "2.1.16"
  namespace = var.prometheus_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/prometheus-values.yaml.tftpl", {
      hostname = var.prometheus_hostname
    })
  ]
}
