
variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "rg_GS_FilRouge"
}

variable "location" {
  description = "Emplacement Azure"
  type        = string
  default     = "westeurope"
}

variable "cluster_name" {
  description = "Nom du cluster AKS"
  type        = string
  default     = "AKS_GS_FilRouge"
}

variable "dns_prefix" {
  description = "Préfixe DNS du cluster AKS"
  type        = string
  default     = "AKS-GS-FilRouge"
}

variable "node_resource_group" {
  description = "Nom du groupe de ressources pour les nœuds"
  type        = string
  default     = "MC_rg_GS_FilRouge"
}

variable "node_count" {
  description = "Nombre de nods du cluster"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "Taille de la machine virtuelle des nœuds"
  type        = string
  default     = "standard_a2m_v2"
}

variable "enable_auto_scaling" {
  description = "Activer ou désactiver le scaling automatique"
  type        = bool
  default     = true
}

variable "min_node_count" {
  description = "Nombre minimal de nœuds lors de le scaling automatique"
  type        = number
  default     = 2
}

variable "max_node_count" {
  description = "Nombre maximal de nœuds lors de le scaling automatique"
  type        = number
  default     = 8
}

variable "node_os_disk_size_gb" {
  description = "Taille du disque OS des nœuds (en Go)"
  type        = number
  default     = 60
}

variable "api_gandi" {
  description = "clé api gandi"
  type        = string
}

variable "mail" {
  description = "email pour l'enregistrement DNS"
  type = string
}

variable "passn8n" {
  description = "password pour n8n"
  type = string
  sensitive = true
}