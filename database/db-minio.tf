resource "helm_release" "minio" {
  count = var.minio_enabled_count
  name       = "minio"
  chart      = "oci://registry-1.docker.io/bitnamicharts/minio"
  version = "17.0.16"
  namespace = var.minio_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/minio-values.yaml.tftpl", {
      externalIPs: var.minio_externalIPs
      existingSecret: var.minio_existing_secret
      hostname: var.minio_hostname
    })
  ]
}
