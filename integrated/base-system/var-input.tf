variable "postgres" {
  type = object({
    enabled = number
    namespace = string
    rootpassword = string
    externalIPs = list(string)
  })
  default = {
    enabled = 1
    namespace = "database"
    rootpassword = ""
    externalIPs = []
  }
}
variable "keycloak" {
  type = object({
    enabled      = number
    namespace    = string
    adminpassword = string
    externalIPs = list(string)
    hostname = string
    db_user = string
    db_password = string
  })
  default = {
    enabled = 1
    namespace = "database"
    adminpassword = ""
    externalIPs = []
    hostname = ""
    db_user = ""
    db_password = ""
  }
}

variable "minio" {
  type = object({
    hostname = string
    externalIPs = list(string)
    namespace = string
  })
  default = {
    hostname = ""
    namespace = "database"
    externalIPs = []
  }
}
variable "openobserve" {
  type = object({
    hostname = string
  })
  default = {
    hostname = ""
  }
}
variable "mailpit" {
  type = object({
    hostname = string
  })
  default = {
    hostname = ""
  }
}

variable "prometheus" {
  type = object({
    grafana_hostname = string
    prometheus_hostname = string
  })
  default = {
    grafana_hostname = ""
    prometheus_hostname = ""
  }
}

variable "mysql" {
  type = object({
    enabled = number
    namespace = string
    rootpassword = string
    externalIPs = list(string)
  })
  default = {
    enabled = 1
    namespace = "database"
    rootpassword = ""
    externalIPs = []
  }
}

variable "kafka" {
  type = object({
    enabled = number
    namespace = string
    rootpassword = string
    externalIPs = list(string)
  })
  default = {
    enabled = 1
    namespace = "database"
    rootpassword = ""
    externalIPs = []
  }
}

variable "redis" {
  type = object({
    enabled = number
    namespace = string
    rootpassword = string
    externalIPs = list(string)
  })
  default = {
    enabled = 1
    namespace = "database"
    rootpassword = ""
    externalIPs = []
  }
}