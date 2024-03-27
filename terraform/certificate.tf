
data "gandi_livedns_domain" "grabibel_me" {
  name = "grabibel.me"
}

resource "gandi_livedns_record" "n8n_grabibel_me" {
  zone = data.gandi_livedns_domain.grabibel_me.id
  name = "n8n"
  type = "A"
  ttl = 3600
  values = [
    data.azurerm_public_ip.ip_aks_lb.ip_address
  ]
}

resource "gandi_livedns_record" "rocket_grabibel_me" {
  zone = data.gandi_livedns_domain.grabibel_me.id
  name = "rocket"
  type = "A"
  ttl = 3600
  values = [
    data.azurerm_public_ip.ip_aks_lb.ip_address
  ]
}

module "cert_manager" {
  depends_on = [ helm_release.traefik, gandi_livedns_record.n8n_grabibel_me, gandi_livedns_record.rocket_grabibel_me ]
  source        = "terraform-iaac/cert-manager/kubernetes"

  cluster_issuer_email                   = "sarais.gabriel@gmail.com"
  cluster_issuer_name                    = "cert-manager-global"
  cluster_issuer_server                  = "https://acme-v02.api.letsencrypt.org/directory"
  solvers                                = [ { "http01": { "ingress": { "class": "traefik" } } } ]
  namespace_name                         = "default"
  create_namespace                       = false
}