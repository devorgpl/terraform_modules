variable "keycloak_postgres_host" {
  type = string
  default = "postgres.default.svc.cluster.local:5432"
}

variable "keycloak_enabled_count" {
  type = number
  default = 1
}

variable "keycloak_hostname" {
  type = string
  default = "keycloak.172.31.65.109.nip.io"
}

variable "keycloak_admin_password" {
  type = string
  default = "default"
}

variable "keycloak_namespace" {
  type = string
  default = "default"
}

variable "keycloak_existing_secret" {
  type = string
  default = null
}
