output "mysql_host" {
  value = "${helm_release.mysql[0].name}.${helm_release.mysql[0].namespace}.svc.cluster.local:1025"
}

output "mysql_rootpassword" {
  value = var.mysql_rootpassword
  sensitive = true
}
