variable "mysql_rootpassword" {
  type = string
  default = null
  # sensitive = true
}
variable "mysql_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}

variable "mysql_namespace" {
  type = string
  default = "default"
}

variable "mysql_existing_secret" {
  type = string
  default = "default"
}

variable "mysql_enabled_count" {
  type = number
  default = 1
}

variable "postgres_enabled_count" {
  type = number
  default = 1
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
