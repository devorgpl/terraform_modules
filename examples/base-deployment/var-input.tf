variable "postgres_rootpassword" {
  type = string
  default = "pgrootpa$$word"
  sensitive = true
}

variable "postgres_externalIPs" {
  type = list(string)
  default = ["172.31.65.101"]
}

variable "keycloak_db_password" {
  type = string
  default = "kcdefaultpass"
}

variable "keycloak_db_user" {
  type = string
  default = "keycloak"
}

variable "keycloak_admin_password" {
  type = string
  default = "kcdefaultpass"
}

variable "keycloak_hostname" {
  type = string
  default = "keycloak.172.31.65.109.nip.io"
}

variable "minio_hostname" {
  type = string
  default = "minio.172.31.65.109.nip.io"
}

variable "openobserve_hostname" {
  type = string
  default = "openobserve.172.31.65.109.nip.io"
}

variable "prometheus_hostname" {
  type = string
  default = "prometheus.172.31.65.109.nip.io"
}

variable "grafana_hostname" {
  type = string
  default = "grafana.172.31.65.109.nip.io"
}

variable "mailpit_hostname" {
  type = string
  default = "mailpit.172.31.65.109.nip.io"
}
