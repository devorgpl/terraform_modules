
resource "kubernetes_secret_v1" "mysql" {
  metadata {
    name = "mysqlsecret"
    namespace = var.mysql_namespace
  }
  data = {
    "mysql-root-password": var.mysql_rootpassword
    "mysql-password": var.mysql_rootpassword
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

}

resource "kubernetes_secret_v1" "redis" {
  metadata {
    name = "redissecret"
    namespace = var.redis_namespace
  }
  data = {
    "redis-root-password": var.redis_rootpassword
  }
}
