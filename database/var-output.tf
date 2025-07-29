output "mysql_host" {
  value = "${helm_release.mysql.name}.${helm_release.mysql.namespace}.svc.cluster.local:1025"
}

