terraform {
  required_providers {
    gandi = {
      source = "go-gandi/gandi"
    }
    acme = {
      source  = "vancluever/acme"
    }
    helm = {
      version = "<2.12.1"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0.2"
    }
  }
}

provider "kubectl" {
  host = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  client_certificate = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)
  client_key = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)
  load_config_file       = false
}

provider "kubernetes" {
  host = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  client_certificate = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)
  client_key = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)
}

provider "azurerm" {
  features {}

  subscription_id   = "<azure_subscription_id>"
  tenant_id         = "<azure_subscription_tenant_id>"
  client_id         = "<service_principal_appid>"
  client_secret     = "<service_principal_password>"
}

provider "helm" { 
  kubernetes {
      host = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
      client_certificate = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)
      client_key = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)
      cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)
  }
}

provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
  #server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

provider "gandi" {
  key = var.api_gandi
}