output "minio_host" {
  value = var.minio_enabled_count == 1 ? "${helm_release.minio[0].name}.${helm_release.minio[0].namespace}.svc.cluster.local:5432": ""
}

output "minio_hostname" {
  value = var.minio_enabled_count == 1 ? "${helm_release.minio[0].name}.${helm_release.minio[0].namespace}.svc.cluster.local": ""
}

output "minio_rootpassword" {
  value = var.minio_rootpassword
  sensitive = true
}

output "minio_username" {
  value = "root"
}
