resource "helm_release" "loki" {
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  create_namespace = true
  values = [
    file("${path.module}/helm-values/loki_values.yaml")
]
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster,
    helm_release.traefik
    ]
    timeout = 600
}
# https://artifacthub.io/packages/helm/grafana/loki