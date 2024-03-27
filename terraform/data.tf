data "azurerm_lb" "aks_lb" {
  name                = "kubernetes"
  resource_group_name = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
  depends_on = [ helm_release.traefik ]

}

data "azurerm_public_ip" "ip_aks_lb" {
  name = "kubernetes-${data.azurerm_lb.aks_lb.frontend_ip_configuration.1.name}"
  resource_group_name = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
  depends_on = [ helm_release.traefik ]
}