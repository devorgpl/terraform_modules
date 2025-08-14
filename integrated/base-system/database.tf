resource "kubernetes_namespace_v1" "database_namespace" {
  metadata {
    name = var.postgres.namespace
  }
  depends_on = [time_sleep.monitoring_installed]
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

resource "kubernetes_secret_v1" "mysql" {
  metadata {
    name = "mysqlsecret"
    namespace = var.mysql.namespace
  }
  data = {
    "mysql-root-password": var.mysql.rootpassword
    "mysql-password": var.mysql.rootpassword
  }
  depends_on = [kubernetes_namespace_v1.database_namespace]
}

module "database_mysql" {
  source = "../../database/mysql"
  depends_on = [kubernetes_secret_v1.mysql, module.database_postgres]
  mysql_enabled_count = var.mysql.enabled
  mysql_existing_secret = kubernetes_secret_v1.mysql.metadata[0].name
  mysql_rootpassword = var.mysql.rootpassword
  mysql_externalIPs = var.mysql.externalIPs
  mysql_namespace = var.mysql.namespace
}

resource "kubernetes_secret_v1" "redis" {
  metadata {
    name = "redissecret"
    namespace = var.redis.namespace
  }
  data = {
    "redis-root-password": var.redis.rootpassword
  }
  depends_on = [kubernetes_namespace_v1.database_namespace]
}

module "database_redis" {
  source = "../../database/redis"
  depends_on = [kubernetes_secret_v1.redis]
  redis_enabled_count = var.redis.enabled
  redis_externalIPs = var.redis.externalIPs
  redis_existing_secret = kubernetes_secret_v1.redis.metadata[0].name
  redis_namespace = var.redis.namespace
  redis_rootpassword = var.redis.rootpassword
}

module "database_kafka" {
  source = "../../database/kafka"
  kafka_enabled_count = var.kafka.enabled
  kafka_externalIPs = var.kafka.externalIPs
  kafka_namespace = var.kafka.namespace
  kafka_rootpassword = var.kafka.rootpassword
  depends_on = [kubernetes_namespace_v1.database_namespace, module.database_mysql]
}
