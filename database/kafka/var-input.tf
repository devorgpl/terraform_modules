variable "kafka_enabled_count" {
  type = number
  default = 1
}

variable "kafka_rootpassword" {
  type = string
  default = null
  # sensitive = true
}
variable "kafka_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}

variable "kafka_namespace" {
  type = string
  default = "default"
}

variable "kafka_existing_secret" {
  type = string
  default = "default"
}
