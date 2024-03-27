resource "random_password" "passwordrc" {
  length           = 26
  special          = false
}
# resource "helm_release" "mongodb" {
#   name       = "mongodb"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "mongodb"
#   set{
#     name = "auth.rootPassword"
#     value = random_password.passwordrc.result
#   }
#   set_list{
#     name = "auth.passwords"
#     value = ["${random_password.passwordrc.result}"]
#   }
#   values     = [file("${path.module}/helm-values/mongodb.yaml")]
#   depends_on = [
#     azurerm_kubernetes_cluster.aks_cluster,
#     helm_release.traefik
#     ]

# }
# https://artifacthub.io/packages/helm/bitnami/mongodb

resource "helm_release" "rocketchat" {
  name       = "rocketchat"
  repository = "https://rocketchat.github.io/helm-charts"
  chart      = "rocketchat"

  values     = [file("${path.module}/helm-values/rocketchat.yaml")]
  depends_on = [
    # helm_release.mongodb,
    azurerm_kubernetes_cluster.aks_cluster,
    helm_release.traefik
    ]
  set_list{
    name = "mongodb.auth.passwords"
    value = ["${random_password.passwordrc.result}"]
  }
  set {
    name = "mongodb.auth.rootPassword"
    value = random_password.passwordrc.result
  }
  set {
    name = "host"
    value = "rocket.grabibel.me"
  }
  timeout = 600
  }
# https://artifacthub.io/packages/helm/rocketchat-server/rocketchat