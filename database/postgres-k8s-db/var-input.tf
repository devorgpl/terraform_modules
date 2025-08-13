variable "postgres_enabled_count" {
  type = number
  default = 1
}
variable "postgres_hostname" {
  type = string
  default = null
  # sensitive = true
}
variable "postgres_rootpassword" {
  type = string
  default = null
  # sensitive = true
}
variable "postgres_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}

variable "postgres_namespace" {
  type = string
  default = "default"
}

variable "postgres_existing_secret" {
  type = string
  default = "default"
}

variable "user_name" {
  type = string
}

variable "user_password" {
  type = string
}

variable "database_name" {
  type = string
}