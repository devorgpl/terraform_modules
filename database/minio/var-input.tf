variable "minio_enabled_count" {
  type = number
  default = 1
}

variable "minio_rootpassword" {
  type = string
  default = null
  # sensitive = true
}
variable "minio_externalIPs" {
  type = list(string)
  default = ["172.31.65.109"]
}

variable "minio_namespace" {
  type = string
  default = "default"
}

variable "minio_existing_secret" {
  type = string
  default = "default"
}

variable "minio_hostname" {
  type = string
  default = "minio.172.31.65.109.nip.io"
}