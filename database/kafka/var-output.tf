output "kafka_host" {
  value = var.kafka_enabled_count == 1 ? "${helm_release.kafka[0].name}.${helm_release.kafka[0].namespace}.svc.cluster.local:5432": ""
}

output "kafka_hostname" {
  value = var.kafka_enabled_count == 1 ? "${helm_release.kafka[0].name}.${helm_release.kafka[0].namespace}.svc.cluster.local": ""
}


output "kafka_rootpassword" {
  value = var.kafka_rootpassword
  sensitive = true
}

output "kafka_username" {
  value = "root"
}
