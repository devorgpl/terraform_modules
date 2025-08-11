variable "postgres_rootpassword" {
  type = string
  default = "pgrootpa$$word"
  sensitive = true
}

variable "postgres_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}
