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
  }
  required_version = "~> 1.12"
}
