resource "random_password" "passwordn8n" {
  length           = 26
  special          = true
  override_special = "!#$%&=+?"
}

resource "helm_release" "postgresql" {
  name       = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"

  values     = [file("${path.module}/helm-values/postgresql.yaml")]
  depends_on = [ 
    azurerm_kubernetes_cluster.aks_cluster,
    helm_release.traefik                
 ]
 set {
   name = "auth.postgresPassword"
   value = random_password.passwordn8n.result
 }
 set {
   name = "auth.password"
   value = random_password.passwordn8n.result
  }
}
# https://artifacthub.io/packages/helm/bitnami/postgresql

resource "helm_release" "n8n" {
  
  name       = "n8n"
  repository = "https://8gears.container-registry.com/chartrepo/library/"
  chart      = "n8n"

  values     = [file("${path.module}/helm-values/n8n.yaml")]

  depends_on = [
    helm_release.postgresql,
    azurerm_kubernetes_cluster.aks_cluster,
    helm_release.traefik
  ]
set {
  name = "secret.database.postgresdb.password"
  value = "${random_password.passwordn8n.result}"
 }

# set_list {
#   name = "extraEnv"
#   value = ["CREDENTIALS_OVERWRITE_DATA='{'${var.passn8n}':{user: 'grabi'}}'"]
# }

  # timeout = 600
}
# https://artifacthub.io/packages/helm/open-8gears/n8n