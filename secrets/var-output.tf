output "mysql_namespace" {
  value = var.mysql_namespace
}

output "mysql_secret_name" {
  value = kubernetes_secret_v1.mysql.metadata[0].name
}

output "postgres_secret_name" {
  value = kubernetes_secret_v1.postgres.metadata[0].name
}
