resource "helm_release" "mysql" {
  name       = "mysql"
  chart      = "oci://registry-1.docker.io/bitnamicharts/mysql"
  version = "13.0.3"

  values = [
    templatefile("${path.module}/helm-values/mysql-values.yaml.tftpl", {
      rootpassword: var.mysql_rootpassword,
      externalIPs: var.mysql_externalIPs
    })
  ]
}
