resource "kubernetes_config_map_v1" "my_custom_cnf" {
  metadata {
    namespace = var.mysql_namespace
    name = "my-custom-cnf"
  }
  data = {"my_custom.cnf" = templatefile("${path.module}/templates/my_custom.cnf.tftpl", {

  })}
}

resource "helm_release" "mysql" {
  count = var.mysql_enabled_count
  name       = "mysql"
  chart      = "oci://registry-1.docker.io/bitnamicharts/mysql"
  version = "13.0.3"
  namespace = var.mysql_namespace
  create_namespace = true
  depends_on = [kubernetes_config_map_v1.my_custom_cnf]

  values = [
    templatefile("${path.module}/helm-values/mysql-values.yaml.tftpl", {
      rootpassword: var.mysql_rootpassword,
      externalIPs: var.mysql_externalIPs
      existingSecret: var.mysql_existing_secret
    })
  ]
}
