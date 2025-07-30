# helm upgrade --install -f local-values/openobserve-values.yaml o2 openobserve/openobserve-standalone
# https://charts.openobserve.ai

resource "helm_release" "openobserve" {
  name       = "openobserve"
  repository = "https://charts.openobserve.ai"
  chart      = "openobserve-standalone"
  version = "0.14.7"
  namespace = var.openobserve_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/openobserve-values.yaml.tftpl", {
      hostname = var.openobserve_hostname
    })
  ]
}
