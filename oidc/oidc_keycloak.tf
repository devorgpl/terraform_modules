
resource "helm_release" "keycloak" {
  name       = "keycloak"
  chart      = "oci://registry-1.docker.io/bitnamicharts/keycloak"
  version = "24.8.1"
  namespace = var.keycloak_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/keycloak-values.yaml.tftpl", {
      hostname = var.keycloak_hostname
    })
  ]
}
