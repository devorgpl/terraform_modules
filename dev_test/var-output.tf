output "mail_host" {
  value = "${helm_release.mailpit.name}.${helm_release.mailpit.namespace}.svc.cluster.local:1025"
}

output "mail_ui" {
  value = "https://${var.mailpit_hostname}"
}
