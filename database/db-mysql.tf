resource "helm_release" "mysql" {
  count = var.mysql_enabled_count
  name       = "mysql"
  chart      = "oci://registry-1.docker.io/bitnamicharts/mysql"
  version = "13.0.3"
  namespace = var.mysql_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/helm-values/mysql-values.yaml.tftpl", {
      rootpassword: var.mysql_rootpassword,
      externalIPs: var.mysql_externalIPs
      existingSecret: var.mysql_existing_secret
    })
  ]
}
