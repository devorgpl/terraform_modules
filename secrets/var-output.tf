output "mysql_namespace" {
  value = var.mysql_namespace
}

output "mysql_secret_name" {
  value = kubernetes_secret_v1.mysql.metadata[0].name
}
