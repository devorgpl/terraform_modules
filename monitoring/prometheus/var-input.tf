variable "prometheus_enabled_count" {
  type = number
  default = 1
}

variable "prometheus_hostname" {
  type = string
  default = "prometheus.172.31.65.109.nip.io"
}

variable "prometheus_namespace" {
  type = string
  default = "default"
}

variable "grafana_hostname" {
  type = string
  default = "grafana.172.31.65.109.nip.io"
}

variable "grafana_namespace" {
  type = string
  default = "default"
}
