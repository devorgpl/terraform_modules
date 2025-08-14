resource "kubernetes_namespace_v1" "idp_namespace" {
  metadata {
    name = "idp"
  }
  depends_on = [time_sleep.database_installed]
}

resource "kubernetes_secret_v1" "keycloak" {
  metadata {
    name = "keycloaksecret"
    namespace = kubernetes_namespace_v1.idp_namespace.metadata[0].name
  }
  data = {
    "admin-password": var.keycloak.adminpassword
    "keycloak-password": var.keycloak.adminpassword
  }
  depends_on = [kubernetes_namespace_v1.idp_namespace]
}

module "keycloak_database" {
  source = "../../database/postgres-db"
  database_name = var.keycloak.db_user
  user_name = var.keycloak.db_user
  user_password = var.keycloak.db_password
  depends_on = [kubernetes_secret_v1.keycloak]
}

module "oidc" {
  source = "../../oidc"
  keycloak_hostname = var.keycloak.hostname
  keycloak_existing_secret = kubernetes_secret_v1.keycloak.metadata[0].name
  keycloak_enabled_count = 1
  keycloak_db_host = module.database_postgres.postgres_hostname
  keycloak_db_user = var.keycloak.db_user
  keycloak_db_database = var.keycloak.db_user
  keycloak_db_password = var.keycloak.db_password
  keycloak_namespace = kubernetes_namespace_v1.idp_namespace.metadata[0].name
  depends_on = [module.keycloak_database, kubernetes_secret_v1.keycloak, kubernetes_namespace_v1.idp_namespace]
}
