
resource "postgresql_role" "keycloak" {
  name = var.user_name
  password = var.user_password
  login            = true
}

resource "postgresql_database" "keycloak" {
  name                   = var.database_name
  owner                  = var.user_name
  template               = "template0"
  lc_collate             = "C"
  connection_limit       = -1
  allow_connections      = true
  alter_object_ownership = true
  depends_on = [postgresql_role.keycloak]
}
