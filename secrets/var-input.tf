variable "mysql_rootpassword" {
  type = string
  default = "pa$$word"
  sensitive = true
}

variable "mysql_namespace" {
  type = string
  default = "default"
}

variable "postgres_rootpassword" {
  type = string
  default = "pa$$word"
  sensitive = true
}

variable "postgres_namespace" {
  type = string
  default = "default"
}

variable "redis_rootpassword" {
  type = string
  default = "pa$$word"
  sensitive = true
}

variable "redis_namespace" {
  type = string
  default = "default"
}
