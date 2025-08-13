terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.37.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.25.0"
    }
  }
  required_version = "~> 1.12"
}
