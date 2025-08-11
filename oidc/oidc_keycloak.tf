
resource "helm_release" "keycloak" {
  count = var.keycloak_enabled_count
  name       = "keycloak"
  chart      = "oci://registry-1.docker.io/bitnamicharts/keycloak"
  version = "24.8.1"
  namespace = var.keycloak_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/keycloak-values.yaml.tftpl", {
      hostname = var.keycloak_hostname
      admin_password = var.keycloak_admin_password
      existing_secret = var.keycloak_existing_secret
    })
  ]
}
