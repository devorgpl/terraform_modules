
resource "time_sleep" "monitoring_installed" {
  create_duration = "5s"
  depends_on = [module.monitoring_prometheus, module.monitoring_openobserve]
}

resource "time_sleep" "database_installed" {
  depends_on = [module.database_postgres, module.database_kafka, module.database_mysql, module.database_redis, module.database_minio]
  create_duration = "20s"
}

module "dev_test_services" {
  source = "../../dev_test"
  mailpit_hostname = var.mailpit.hostname
}
