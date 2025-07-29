variable "mysql_rootpassword" {
  type = string
  default = "pa$$word"
  # sensitive = true
}
variable "mysql_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}
