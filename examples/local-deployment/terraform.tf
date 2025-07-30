
module "secrets" {
  source = "../../secrets"
  mysql_rootpassword = "rootpa$$word"

}

module "substitute_services" {
  source = "../../substitute"
  mailpit_hostname = var.mailpit_hostname
}

module "database_services" {
  source = "../../database"
  mysql_externalIPs = var.mysql_externalIPs
  mysql_existing_secret = module.secrets.mysql_secret_name
  depends_on = [module.secrets]
}
