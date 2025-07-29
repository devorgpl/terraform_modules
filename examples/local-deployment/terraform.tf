module "substitute_services" {
  source = "../../substitute"
  mailpit_hostname = var.mailpit_hostname
}

module "database_services" {
  source = "../../database"
  mysql_rootpassword = var.mysql_rootpassword
  mysql_externalIPs = var.mysql_externalIPs
}
