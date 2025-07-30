
resource "kubernetes_secret_v1" "mysql" {
  metadata {
    name = "mysqlsecret"
    namespace = var.mysql_namespace
  }
  data = {
    "mysql-root-password": var.mysql_rootpassword
    "mysql-password": var.mysql_rootpassword
  }
}
