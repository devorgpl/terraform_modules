
module "base-system" {
  source = "../../integrated/base-system"
  postgres = {
    enabled = 1
    rootpassword = "rootPass123word"
    externalIPs = ["172.31.65.101"]
    namespace = "database"
  }
  keycloak = {
    enabled = 1
    namespace = "idp"
    db_user = "keycloak"
    db_password = "Pass123#@!"
    adminpassword = "kcpassword"
    externalIPs = ["172.31.65.101"]
    hostname = "keycloak.172.31.65.109.nip.io"
  }
  minio = {
    namespace = "database"
    hostname = "minio.172.31.65.109.nip.io"
    externalIPs = []
  }
  openobserve = {
    hostname = "openobserve.172.31.65.109.nip.io"
  }
  prometheus = {
    grafana_hostname = "grafana.172.31.65.109.nip.io"
    prometheus_hostname = "prometheus.172.31.65.109.nip.io"
  }
  mailpit = {
    hostname = "mailpit.172.31.65.109.nip.io"
  }
}
