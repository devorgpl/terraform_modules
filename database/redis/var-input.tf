variable "redis_enabled_count" {
  type = number
  default = 1
}

variable "redis_rootpassword" {
  type = string
  default = null
  # sensitive = true
}
variable "redis_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}

variable "redis_namespace" {
  type = string
  default = "default"
}

variable "redis_existing_secret" {
  type = string
  default = "default"
}
