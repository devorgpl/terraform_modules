resource "helm_release" "postgres" {
  count = var.postgres_enabled_count
  name       = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  namespace = var.postgres_namespace
  version = "16.7.20"

  values = [
    templatefile("${path.module}/helm-values/postgres-values.yaml.tftpl", {
      rootpassword: var.postgres_rootpassword,
      externalIPs: var.postgres_externalIPs
      existingSecret: var.postgres_existing_secret
    })
  ]
}

resource "kubernetes_service_v1" "postgres_external" {
  depends_on = [helm_release.postgres]
  metadata {
    name = "postgresql-external"
    namespace = var.postgres_namespace
  }
  spec {
    type = "ClusterIP"
    selector = {
      "app.kubernetes.io/component" = "primary"
      "app.kubernetes.io/instance" = "postgresql"
      "app.kubernetes.io/name": "postgresql"
    }
    port {
      name = "tcp-postgresql"
      port        = 5432
      target_port = "tcp-postgresql"
      protocol = "TCP"
    }
    external_ips = var.postgres_externalIPs
  }
}
