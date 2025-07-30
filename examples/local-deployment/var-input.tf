variable "mailpit_hostname" {
  type = string
  default = "mailtpit.fbi.com"
}

variable "mailpit_namespace" {
  type = string
  default = "default"
}

variable "mysql_rootpassword" {
  type = string
  default = "mysqlrootpa$$word"
  sensitive = true
}

variable "postgres_rootpassword" {
  type = string
  default = "pgrootpa$$word"
  sensitive = true
}

variable "mysql_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}
