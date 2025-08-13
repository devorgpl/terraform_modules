
module "base-system" {
  source = "../../integrated/base-system"
  # source = "github.com/devorgpl/terraform_modules/integrated/base-system"
  postgres = {
    enabled = 1
    rootpassword = var.postgres_rootpassword
    externalIPs = ["172.31.65.101"]
    namespace = "database"
  }
  keycloak = {
    enabled = 1
    namespace = "idp"
    db_user = "keycloak"
    db_password = var.keycloak_db_password
    adminpassword = var.keycloak_admin_password
    externalIPs = ["172.31.65.101"]
    hostname = var.keycloak_hostname
  }
  minio = {
    namespace = "database"
    hostname = var.minio_hostname
    externalIPs = []
  }
  openobserve = {
    hostname = var.openobserve_hostname
  }
  prometheus = {
    grafana_hostname = var.grafana_hostname
    prometheus_hostname = var.prometheus_hostname
  }
  mailpit = {
    hostname = var.mailpit_hostname
  }
}
