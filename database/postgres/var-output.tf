output "mysql_host" {
  value = var.mysql_enabled_count == 1 ? "${helm_release.mysql[0].name}.${helm_release.mysql[0].namespace}.svc.cluster.local:3306": ""
}

output "mysql_rootpassword" {
  value = var.mysql_rootpassword
  sensitive = true
}

output "postgres_host" {
  value = var.postgres_enabled_count == 1 ? "${helm_release.postgres[0].name}.${helm_release.postgres[0].namespace}.svc.cluster.local:5432": ""
}

output "postgres_rootpassword" {
  value = var.postgres_rootpassword
  sensitive = true
}
