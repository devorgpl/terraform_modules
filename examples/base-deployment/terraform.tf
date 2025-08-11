
module "secrets" {
  source = "../../secrets"
  postgres_rootpassword = var.postgres_rootpassword
}

module "database_postgres" {
  source = "../../database/postgres"
  postgres_existing_secret = module.secrets.postgres_secret_name
  postgres_externalIPs = var.postgres_externalIPs
  depends_on = [module.secrets]
}

provider "postgresql" {
  database_username = "postgres"
  username = "postgres"
  password = module.database_postgres.postgres_rootpassword
  host = var.postgres_externalIPs[0]
  sslmode  = "disable"
}

resource "postgresql_role" "keycloak" {
  name = "keycloak"
  password = "keycloakdbpass"
  login            = true
  depends_on = [module.database_postgres]
}

resource "postgresql_database" "keycloak" {
  name                   = "keycloak"
  owner                  = postgresql_role.keycloak.name
  template               = "template0"
  lc_collate             = "C"
  connection_limit       = -1
  allow_connections      = true
  alter_object_ownership = true
  depends_on = [module.database_postgres, postgresql_role.keycloak]
}

module "oidc" {
  source = "../../oidc"
  keycloak_hostname = "keycloak.172.31.65.109.nip.io"
  keycloak_enabled_count = 0
}

module "monitoring_prometheus" {
  source = "../../monitoring/prometheus"
  prometheus_namespace = "monitoring"
  prometheus_enabled_count = 0
  depends_on = [module.secrets]
}

module "dev_test_services" {
  source = "../../dev_test"
  depends_on = [module.secrets]
}
