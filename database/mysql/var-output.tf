output "mysql_host" {
  value = var.mysql_enabled_count == 1 ? "${helm_release.mysql[0].name}.${helm_release.mysql[0].namespace}.svc.cluster.local:5432": ""
}

output "mysql_hostname" {
  value = var.mysql_enabled_count == 1 ? "${helm_release.mysql[0].name}.${helm_release.mysql[0].namespace}.svc.cluster.local": ""
}


output "mysql_rootpassword" {
  value = var.mysql_rootpassword
  sensitive = true
}

output "mysql_username" {
  value = "root"
}
