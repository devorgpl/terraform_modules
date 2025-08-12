resource "kubernetes_namespace_v1" "idp_namespace" {
  metadata {
    name = "idp"
  }
}

resource "kubernetes_secret_v1" "keycloak" {
  metadata {
    name = "keycloaksecret"
    namespace = kubernetes_namespace_v1.idp_namespace.metadata[0].name
  }
  data = {
    "admin-password": var.keycloak_admin_password
    "keycloak-password": var.keycloak_admin_password
  }
}

resource "postgresql_role" "keycloak" {
  name = var.keycloak_db_user
  password = var.keycloak_db_password
  login            = true
  depends_on = [module.database_postgres]
}

resource "postgresql_database" "keycloak" {
  name                   = var.keycloak_db_user
  owner                  = var.keycloak_db_user
  template               = "template0"
  lc_collate             = "C"
  connection_limit       = -1
  allow_connections      = true
  alter_object_ownership = true
  depends_on = [module.database_postgres, postgresql_role.keycloak]
}

module "oidc" {
  source = "../../oidc"
  keycloak_hostname = var.keycloak_hostname
  keycloak_existing_secret = kubernetes_secret_v1.keycloak.metadata[0].name
  keycloak_enabled_count = 1
  keycloak_db_host = module.database_postgres.postgres_hostname
  keycloak_db_user = var.keycloak_db_user
  keycloak_db_database = var.keycloak_db_user
  keycloak_db_password = var.keycloak_db_password
  keycloak_namespace = kubernetes_namespace_v1.idp_namespace.metadata[0].name
}
