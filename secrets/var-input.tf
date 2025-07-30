variable "mysql_rootpassword" {
  type = string
  default = "pa$$word"
  sensitive = true
}

variable "mysql_namespace" {
  type = string
  default = "default"
}
