resource "helm_release" "traefik" {
  version    = "25.0.0"
  name       = "traefik"
  chart      = "traefik"
  repository = "https://traefik.github.io/charts"

  values = [
    file("${path.module}/helm-values/traefik.yaml")
  ]
  set {
    name = "certResolvers.letsencrypt.email"
    value = "${var.mail}"
  }
  depends_on = [ azurerm_kubernetes_cluster.aks_cluster ]
}
# https://artifacthub.io/packages/helm/traefik/traefik

# resource "helm_release" "cert-manager" {
#   name       = "cert-manager"
#   chart      = "cert-manager"
#   repository = "https://charts.jetstack.io"

#   values = [
#     file("${path.module}/helm-values/certmanager.yaml")
#   ]
#   depends_on = [ azurerm_kubernetes_cluster.aks_cluster ]
# }
# # https://artifacthub.io/packages/helm/cert-manager/cert-manager
