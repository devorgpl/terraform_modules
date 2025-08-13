resource "kubernetes_namespace_v1" "database_namespace" {
  metadata {
    name = var.postgres.namespace
  }
}

resource "kubernetes_secret_v1" "postgres" {
  metadata {
    name = "postgressecret"
    namespace = var.postgres.namespace
  }
  data = {
    "postgres-root-password": var.postgres.rootpassword
    "postgres-password": var.postgres.rootpassword
  }
  depends_on = [kubernetes_namespace_v1.database_namespace]
}

module "database_postgres" {
  source = "../../database/postgres"
  postgres_existing_secret = kubernetes_secret_v1.postgres.metadata[0].name
  postgres_externalIPs = var.postgres.externalIPs
  depends_on = [kubernetes_secret_v1.postgres]
  postgres_namespace = var.postgres.namespace
}

# MINIO
module "database_minio" {
  source = "../../database/minio"
  minio_existing_secret = kubernetes_secret_v1.postgres.metadata[0].name
  minio_externalIPs = var.minio.externalIPs
  depends_on = [kubernetes_secret_v1.postgres]
  minio_namespace = var.minio.namespace
  minio_hostname = var.minio.hostname
}
