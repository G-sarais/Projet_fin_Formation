resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix
  node_resource_group = var.node_resource_group

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    enable_auto_scaling = var.enable_auto_scaling
    min_count = var.min_node_count
    max_count = var.max_node_count
    type            = "VirtualMachineScaleSets"
    os_disk_size_gb = var.node_os_disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }
}