
module "secrets" {
  source = "../../secrets"
  mysql_rootpassword = var.mysql_rootpassword
  postgres_rootpassword = var.postgres_rootpassword
}

module "monitoring" {
  source = "../../monitoring"
}

module "dev_test_services" {
  source = "../../dev_test"
  mailpit_hostname = var.mailpit_hostname
}

module "database_services" {
  source = "../../database"
  mysql_externalIPs = var.mysql_externalIPs
  mysql_existing_secret = module.secrets.mysql_secret_name
  postgres_existing_secret = module.secrets.postgres_secret_name
  mysql_enabled_count = 0
  redis_enabled_count = 0
  kafka_enabled_count = 0
  depends_on = [module.secrets]
}
