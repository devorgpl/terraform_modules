
module "secrets" {
  source = "../../secrets"
  postgres_rootpassword = var.postgres_rootpassword
}

module "oidc" {
  source = "../../oidc"
  keycloak_hostname = "keycloak.172.31.65.109.nip.io"
  keycloak_enabled_count = 0
}

module "monitoring_prometheus" {
  source = "../../monitoring/prometheus"
  prometheus_namespace = "monitoring"
  depends_on = [module.secrets]
}

module "database_postgres" {
  source = "../../database/postgres"
  postgres_existing_secret = module.secrets.postgres_secret_name
  depends_on = [module.secrets]
}

module "dev_test_services" {
  source = "../../dev_test"
  depends_on = [module.secrets]
}
