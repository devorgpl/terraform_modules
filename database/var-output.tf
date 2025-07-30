output "mysql_host" {
  value = "${helm_release.mysql.name}.${helm_release.mysql.namespace}.svc.cluster.local:1025"
}

output "mysql_rootpassword" {
  value = var.mysql_rootpassword
  sensitive = true
}

