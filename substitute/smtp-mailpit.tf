resource "helm_release" "mailpit" {
  name       = "mailpit"
  repository = "https://jouve.github.io/charts/"
  chart      = "mailpit"
  version = "0.27.0"
  namespace = var.mailpit_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/mailpit-values.yaml.tftpl", {
      hostname = var.mailpit_hostname
    })
  ]
}
