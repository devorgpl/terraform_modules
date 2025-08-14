resource "helm_release" "redis" {
  count = var.redis_enabled_count
  name       = "redis"
  chart      = "oci://registry-1.docker.io/bitnamicharts/redis"
  version = "21.2.12"
  namespace = var.redis_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/redis-values.yaml.tftpl", {
      externalIPs: var.redis_externalIPs
      existingSecret: var.redis_existing_secret
    })
  ]
}
