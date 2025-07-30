resource "helm_release" "postgres" {
  name       = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version = "16.7.20"

  values = [
    templatefile("${path.module}/helm-values/postgres-values.yaml.tftpl", {
      rootpassword: var.postgres_rootpassword,
      externalIPs: var.postgres_externalIPs
      existingSecret: var.postgres_existing_secret
    })
  ]
}
