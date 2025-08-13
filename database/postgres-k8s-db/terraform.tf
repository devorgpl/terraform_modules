# NOT WORKING!
locals {
  create_script = templatefile("${path.module}/templates/create_db_if_not_exists.sql.tftpl", {
    database_name: var.postgres_rootpassword,
    user_name: var.postgres_externalIPs
    user_password: var.postgres_existing_secret
  })
}

resource "kubernetes_job_v1" "database" {
  metadata {
    namespace = var.postgres_namespace
  }
  spec {
    template {
      spec {
        container {
          name = "create-db"
          image = "docker.io/bitnami/postgresql:17"
          command = [ "bin/sh", "-c", "psql -a -f /sqlCommand.sql" ]
          env = {
            DB_HOST = var.postgres_hostname
            DB_PASSWORD = var.postgres_rootpassword
          }
        }
      }
    }
  }
}