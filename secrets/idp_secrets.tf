
resource "kubernetes_secret_v1" "keycloak" {

  metadata {
    name = "keycloaksecret"
    namespace = var.keycloak_namespace
  }
  data = {
    "admin-password": var.keycloak_rootpassword
    "keycloak-password": var.keycloak_rootpassword
  }
}
