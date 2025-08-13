
provider "kubernetes" {
  # for helm run  export KUBE_CONFIG_PATH=/home/user/.kube/config
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
  #  helm repo update --repository-cache /home/user/src/terraform_modules/target/helm_cache/
  repository_cache = "../../target/helm_cache"
}

provider "postgresql" {
  database_username = "postgres"
  username = "postgres"
  password = var.postgres_rootpassword
  host = var.postgres_externalIPs[0]
  sslmode  = "disable"
}
