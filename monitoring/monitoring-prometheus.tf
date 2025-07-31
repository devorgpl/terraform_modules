resource "helm_release" "prometheus" {
  count = 0
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

resource "helm_release" "kube-prometheus" {
  count = 0
  name       = "kubeprometheus"
  chart      = "oci://registry-1.docker.io/bitnamicharts/kube-prometheus"
  version = "11.2.16"
  namespace = var.prometheus_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/prometheus-values.yaml.tftpl", {
      hostname = var.prometheus_hostname
    })
  ]
}
