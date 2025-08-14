resource "helm_release" "kafka" {
  count            = var.kafka_enabled_count
  name             = "kafka"
  chart            = "oci://registry-1.docker.io/bitnamicharts/kafka"
  version          = "32.3.9"
  namespace        = var.kafka_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/kafka-values.yaml.tftpl", {
      externalIPs : var.kafka_externalIPs
      existingSecret : var.kafka_existing_secret
    })
  ]
}
