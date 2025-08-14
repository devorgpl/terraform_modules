output "redis_host" {
  value = var.redis_enabled_count == 1 ? "${helm_release.redis[0].name}.${helm_release.redis[0].namespace}.svc.cluster.local:5432": ""
}

output "redis_hostname" {
  value = var.redis_enabled_count == 1 ? "${helm_release.redis[0].name}.${helm_release.redis[0].namespace}.svc.cluster.local": ""
}


output "redis_rootpassword" {
  value = var.redis_rootpassword
  sensitive = true
}

output "redis_username" {
  value = "root"
}
