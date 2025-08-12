resource "kubernetes_namespace_v1" "database_namespace" {
  metadata {
    name = var.postgres_namespace
  }
}

resource "kubernetes_secret_v1" "postgres" {
  metadata {
    name = "postgressecret"
    namespace = var.postgres_namespace
  }
  data = {
    "postgres-root-password": var.postgres_rootpassword
    "postgres-password": var.postgres_rootpassword
  }
  depends_on = [kubernetes_namespace_v1.database_namespace]
}

module "database_postgres" {
  source = "../../database/postgres"
  postgres_existing_secret = kubernetes_secret_v1.postgres.metadata[0].name
  postgres_externalIPs = var.postgres_externalIPs
  depends_on = [kubernetes_secret_v1.postgres]
  postgres_namespace = var.postgres_namespace
}

provider "postgresql" {
  database_username = "postgres"
  username = "postgres"
  password = module.database_postgres.postgres_rootpassword
  host = var.postgres_externalIPs[0]
  sslmode  = "disable"
}

# MINIO
module "database_minio" {
  source = "../../database/minio"
  minio_existing_secret = kubernetes_secret_v1.postgres.metadata[0].name
  minio_externalIPs = var.postgres_externalIPs
  depends_on = [kubernetes_secret_v1.postgres]
  minio_namespace = var.postgres_namespace
  minio_hostname = var.minio_hostname
}
