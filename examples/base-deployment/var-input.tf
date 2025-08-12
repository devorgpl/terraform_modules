variable "postgres_namespace" {
  type = string
  default = "database"
}

variable "postgres_rootpassword" {
  type = string
  default = "pgrootpa$$word"
  sensitive = true
}

variable "postgres_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
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

variable "minio_hostname" {
  type = string
  default = "minio.172.31.65.109.nip.io"
}
