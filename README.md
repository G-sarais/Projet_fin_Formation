# Table of contents

- [Introduction](#introduction)
- [Liste des compétences couvertes](#liste-des-comptences-couvertes)
- [Cahier des charges - Déploiement de n8n, Rocket.Chat, Prometheus et Grafana sur AKS avec scaling horizontal](#cahier-des-charges---dploiement-de-n8n-rocketchat-prometheus-et-grafana-sur-aks-avec-scaling-horizontal)
  - [Contexte](#contexte)
  - [Objectifs](#objectifs)
  - [Spécifications techniques](#spcifications-techniques)
  - [Livrables](#livrables)
  - [Contraintes](#contraintes)
- [Spécifications techniques](#spcifications-techniques)
  - [Description technique détaillée du projet](#description-technique-dtaille-du-projet)
  - [Schéma de l'infrastructure à déployer ou de l'application à mettre en production](#schma-de-linfrastructure--dployer-ou-de-lapplication--mettre-en-production)
  - [Coûts](#cots)
- [Démarche du projet](#dmarche-du-projet)
  - [Méthodologie appliquée](#mthodologie-applique)
  - [Outils utilisés](#outils-utiliss)
- [Réalisations du candidat](#ralisations-du-candidat)
  - [Scripts et configurations développés](#scripts-et-configurations-dvelopps)
  - [Contributions significatives au projet](#contributions-significatives-au-projet)
  - [Argumentation sur les choix techniques](#argumentation-sur-les-choix-techniques)
- [Investigation Technique et Résolution de Problèmes](#investigation-technique-et-rsolution-de-problmes)
  - [Résolution d'un Défi Technique Spécifique](#rsolution-dun-dfi-technique-spcifique)
  - [Méthodologie de recherche](#mthodologie-de-recherche)
  - [Résultats et application au projet](#rsultats-et-application-au-projet)
- [Conclusion](#conclusion)
  - [Synthèse des compétences développées](#synthse-des-comptences-dveloppes)
  - [Retour sur expérience](#retour-sur-exprience)
  - [Perspectives d'évolution du projet](#perspectives-dvolution-du-projet)
- [Annexes](#annexes)
  - [N8N](#n8n)
  - [Rocket.chat](#rocketchat)
  - [Pipeline](#pipeline)
  - [Terraform](#terraform)

# Introduction
Durant ma formation en alternance, j'ai eu l'opportunité d'acquérir une expérience précieuse en tant qu'analyste SOC chez Devensys Cybersecurity. Mes missions principales consistaient à traiter les alertes du SOC, améliorer les règles d'alerting et renforcer l'automatisation de leur traitement. Bien que passionnantes et enrichissantes, ces activités ne couvraient pas l'ensemble des compétences requises pour mon diplôme. C'est pourquoi j'ai décidé de mener un projet personnel en parallèle.

Ce projet, que j'ai initié et développé de mon côté, avait pour but de créer une plateforme de communication efficace pour une entreprise, en utilisant Rocket.Chat. J'ai enrichi cette plateforme en y intégrant une fonctionnalité d'automatisation des notifications en provenance d'autres services, comme GitLab grâce à n8n, permettant ainsi une meilleure synchronisation et réactivité au sein des équipes. L'idée était de concevoir non seulement un outil de communication interne, mais également une solution qui facilite la gestion des flux d'informations et des alertes, améliorant ainsi la collaboration et l'efficacité opérationnelle.

# Liste des compétences couvertes

* [x] **Automatiser le déploiement d'une infrastructure dans le cloud**
    - [x] Automatiser la création de serveurs à l'aide de scripts
    - [x] Automatiser le déploiement d'une infrastructure
    - [x] Sécuriser l'infrastructure 
    - [x] Mettre l'infrastructure en production dans le cloud

* [x] Déployer en continu une application
    - [ ] Préparer un environnement de test
    - [x] Gérer le stockage des données
    - [x] Gérer des containers
    - [x] Automatiser la mise en production d'une application avec une plateforme

* [x] Superviser les services déployés
    - [x] Définir et mettre en place des statistiques de services
    - [x] Exploiter une solution de supervision
    - [ ] Échanger sur des réseaux professionnels éventuellement en anglais

# Cahier des charges - Déploiement de n8n, Rocket.Chat, Prometheus et Grafana sur AKS avec scaling horizontal

## Contexte
L'objectif de ce projet est de déployer les applications n8n, Rocket.Chat, Prometheus et Grafana dans une infrastructure Kubernetes sur Azure Kubernetes Service (AKS) en utilisant le scaling horizontal. L'objectif final est de mettre en place un système de notification dans Rocket.Chat à l'aide de n8n. Prometheus et Grafana seront également installés pour offrir une supervision de l'infrastructure.

## Objectifs
Les objectifs spécifiques de ce projet sont les suivants:
1. Déployer une infrastructure Kubernetes sur AKS.
2. Déployer n8n sur l'infrastructure Kubernetes pour automatiser les workflows et les notifications.
3. Déployer Rocket.Chat sur l'infrastructure Kubernetes pour fournir une plateforme de communication.
4. Configurer n8n pour envoyer des notifications vers Rocket.Chat.
1. Installer Prometheus pour collecter les métriques.
1. Configurer Grafana pour afficher des tableaux de bord avec les métriques.
3. Mettre en place le scaling horizontal pour les services n8n, Rocket.Chat.

## Spécifications techniques
1. L'infrastructure Kubernetes sera déployée sur Azure Kubernetes Service (AKS).
2. Le déploiement des applications sera réalisé en utilisant des templates terraform.
3. Les services n8n et Rocket.Chat seront déployés en utilisant des déploiements Helm.
4. Les pods des déploiements seront configurés pour fonctionner avec un nombre de répliques initial et une politique de scaling horizontal.
5. n8n sera configuré pour envoyer des notifications vers Rocket.Chat en utilisant les webhooks.
6. Prometheus sera installé pour collecter les métriques de base des services et des pods.
7. Grafana sera installé pour afficher des tableaux de bord basiques avec les métriques collectées par Prometheus.

## Livrables
Les livrables attendus pour ce projet sont les suivants:
1. Les template terraform pour le déploiement de l'infrastructure et des applications.
2. Les configurations helm des applications.
3. Un DAT du projet.

## Contraintes
Les contraintes suivantes doivent être prises en compte dans ce projet:
1. Utilisation d'Azure Kubernetes Service (AKS) comme plateforme de déploiement.
2. Les ressources devrons être situées dans la région West Europe.
3. Respecter les bonnes pratiques de sécurité pour les déploiements Kubernetes.
4. Assurer la haute disponibilité et la résilience des applications déployées.

# Spécifications techniques
## Description technique détaillée du projet
La configuration de l'infrastructure est définie en code à l'aide de Terraform. Les fichiers .tf spécifient les ressources Azure, les configurations réseau, les politiques de sécurité, et la création des instances Kubernetes. Helm est utilisé pour simplifier le déploiement des applications dans AKS, en permettant une gestion aisée des configurations à travers des charts Helm.

L'intégration de GitLab CI joue un rôle crucial dans le projet, permettant un déploiement continu et automatique des modifications de l'infrastructure et des applications. Cette approche assure que les mises à jour et les changements sont appliqués de manière cohérente et fiable, réduisant ainsi les risques d'erreurs humaines et accélérant le cycle de développement.

Le projet intègre également des pratiques de sécurité, notamment la gestion des certificats TLS pour sécuriser les communications, et le masquage des variables sensibles pour protéger les données confidentielles.

En somme, le projet allie les technologies de cloud, de conteneurisation, d'automatisation, et de monitoring pour créer une infrastructure cloud moderne, sécurisée, adaptable aux besoins de communication et d'automatisation d'une entreprise.

### Applications utilisées
- **Rocket.Chat** est une plateforme de communication d'entreprise open-source qui permet la messagerie instantanée, le partage de fichiers, les appels vidéo et audio, et les salons de discussion. Elle est conçue pour améliorer la collaboration interne avec des fonctionnalités de personnalisation, d'intégration, et de sécurité. Rocket.Chat peut être déployée dans des environnements cloud ou sur site et supporte des plugins pour étendre ses fonctionnalités.

- **N8N** est un outil d'automatisation de workflow qui permet d'intégrer et de connecter divers services et applications. Il utilise un modèle basé sur des "nœuds" qui représentent différentes actions ou déclencheurs dans un processus d'automatisation. n8n permet de créer des workflows personnalisés qui peuvent manipuler des données, déclencher des actions dans d'autres applications et automatiser des tâches répétitives.

- **Traefik** est un reverse proxy et un load balancer moderne conçu pour les microservices. Il simplifie le routage du trafic réseau et gère automatiquement les certificats SSL. Traefik s'intègre parfaitement avec des systèmes d'orchestration comme Kubernetes et fournit une interface utilisateur pour la visualisation et le débogage du trafic réseau.

- **Grafana** est une plateforme d'analyse et de visualisation des données open-source. Elle est largement utilisée pour le monitoring d'infrastructures et d'applications, offrant des tableaux de bord dynamiques qui peuvent être personnalisés avec diverses sources de données, telles que Prometheus. Grafana permet de visualiser des métriques complexes sous forme de graphiques, de jauges et d'autres représentations visuelles.

- **Prometheus** est un système de monitoring et d'alerting open-source qui collecte et stocke ses métriques sous forme de séries temporelles. Avec son puissant langage de requête, Prometheus permet d'analyser ces métriques et de générer des alertes en cas d'anomalies ou de problèmes détectés dans l'infrastructure ou les applications.

- **Cert-Manager** est un gestionnaire de certificats pour Kubernetes, facilitant l'obtention, le renouvellement et l'utilisation de certificats TLS/SSL. Il automatise la gestion des certificats avec des émetteurs comme Let's Encrypt, simplifiant ainsi la mise en place de la communication sécurisée dans les applications Kubernetes.

- **GitLab** est une plateforme DevOps complète qui offre la gestion de version avec Git, ainsi que des fonctionnalités de CI/CD (Continuous Integration/Continuous Deployment), de suivi des problèmes, de gestion de projets, et plus. GitLab facilite la collaboration et l'automatisation du pipeline de développement de logiciels, depuis la planification jusqu'à la production.

- **Helm** est un gestionnaire de packages pour Kubernetes, permettant aux développeurs et aux opérateurs de définir, d'installer et de mettre à jour des applications Kubernetes. Helm utilise des "charts" qui sont des packages préconfigurés pouvant être déployés de manière répétée et fiable.

- **Terraform** est un outil d'Infrastructure as Code (IaC) qui permet de créer, modifier et versionner l'infrastructure de manière sécurisée et efficace. Il utilise des fichiers de configuration pour décrire les ressources nécessaires à l'exécution d'une application ou d'un service, et peut gérer les fournisseurs de services cloud tels que Azure, kubernetes, AWS, Google Cloud, et d'autres.

## Schéma de l'infrastructure à déployer ou de l'application à mettre en production
![HkPObTFPT](https://github.com/G-sarais/Projet_fin_Formation/assets/99554412/556b3f23-f895-471a-a8e4-13c79526f2ae)




### Structure du code
- **terraform**
  - **helm-values**: Dossier contenant les fichiers de valeurs pour les charts Helm.
    - `loki_values.yaml`: Valeurs personnalisées pour le déploiement de Loki, Grafana et Prometheus.
    - `n8n.yaml`: Paramètres pour n8n, un outil d'automatisation des workflows.
    - `postgresql.yaml`: Configuration pour PostgreSQL, un système de gestion de base de données relationnelle.
    - `rocketchat.yaml`: Fichier de configuration pour le déploiement de RocketChat, une plateforme de communication et sa base de données MongoDB.
    - `traefik.yaml`: Configuration de Traefik.
  - `backend.tf`: Configuration du backend Terraform pour le stockage de l'état.
  - `certificate.tf`: Définitions Terraform pour la création de certificats.
  - `data.tf`: Sources de données Terraform utilisées dans le projet.
  - `main.tf`: Fichier principal Terraform contenant la configuration de base.
  - `n8n.tf`: Configuration Terraform pour le déploiement de n8n.
  - `providers.tf`: Déclaration des providers Terraform utilisés dans le projet.
  - `rocketchat.tf`: Configuration Terraform pour le déploiement de RocketChat.
  - `supervision.tf`: Configuration Terraform pour les outils de supervision comme Grafana et Prometheus.
  - `traefik.tf`: Configuration Terraform pour le déploiement de Traefik.
  - `variables.tf`: Déclaration des variables pour le projet Terraform.
- `.gitlab-ci.yml`: Configuration du pipeline CI/CD avec GitLab CI.

### Infrastructure
Gérée par Terraform, déployant des ressources sur Azure (AKS, ressource groupe, etc.).
- **providers.tf**:
 je fais appel à plusieurs providers Terraform pour interagir avec différents services, comme Gandi pour la gestion de domaine, ACME pour les certificats SSL/TLS, Helm pour la gestion des applications Kubernetes et kubectl pour l'interaction directe avec le cluster Kubernetes. J'ai aussi fait attention à spécifier des versions précises, pour assurer la compatibilité avec les outils spécifiques que j'utilise.
    1. Dans le bloc Terraform, j'ai spécifié les providers que j'utilise :
        - Provider Gandi : Je l'utilise pour la gestion des domaines ou des certificats liés à Gandi.
            ```source = "go-gandi/gandi```
       - Provider ACME : Je l'utilise pour la création et la gestion de certificats SSL/TLS avec le protocole ACME.
           ```source = "vancluever/acme```
           ```version = "<2.19.0"```
       - Provider Helm : Je l'utilise pour gérer les déploiements des applications Kubernetes via Helm.
            ```version = "<2.12.1"```
        - Provider Kubectl : Il me fournit un moyen d'interagir avec mon cluster Kubernetes.
            ```source = "alekc/kubectl"```
            ```version = ">= 2.0.2"```
    
    1. Provider Gandi
       - Je l'utilise pour la gestion des domaines ou des certificats liés à Gandi. Ce provider me permet de manipuler des ressources spécifiques à Gandi, comme les enregistrements DNS ou les certificats SSL.
   
    2. Provider ACME
       - Ce provider est utilisé pour la création et la gestion de certificats SSL/TLS via le protocole ACME. Il est essentiel pour automatiser le processus de sécurisation de mes communications en ligne.

    3. Provider Helm
       - Je me sers de ce provider pour gérer les déploiements des applications Kubernetes via Helm. Cela facilite l'installation et la mise à jour des applications dans mon cluster Kubernetes.

    4. Provider Kubectl
       - Ce provider me fournit un moyen d'interagir directement avec mon cluster Kubernetes. Je l'utilise pour appliquer des configurations, gérer des ressources et exécuter des commandes dans le cluster.



- data.tf:
Ce fichier est crucial car il établit une connexion entre les ressources que je déploie avec Terraform et celles qui existent déjà dans mon environnement Azure. Cette configuration me permet d'intégrer ces ressources dans d'autres segments de ma configuration Terraform. Plus précisément, je l'utilise pour récupérer l'adresse IP publique qui a été attribuée au load balancer par le déploiement de Traefik.
    1. Load Balancer (LB) Azure Kubernetes Service (AKS) :
        - ```data "azurerm_lb" "aks_lb"``` : Cette déclaration récupère les informations d'un load balancer existant dans Azure.
            - name : Le nom du load balancer recherché, dans ce cas, "kubernetes".
            - resource_group_name : Le nom du groupe de ressources où se trouve le load balancer, qui est le même groupe de ressources que celui du cluster AKS.
            - depends_on : Cette configuration indique une dépendance vis-à-vis de la sortie du déploiement de Traefik via Helm, assurant que le load balancer est consulté après le déploiement de Traefik.
    1. Adresse IP publique du Load Balancer AKS :
        - ```data "azurerm_public_ip" "ip_aks_lb"``` : Ce bloc de données récupère les informations sur une adresse IP publique associée au load balancer AKS.
            - name : Le nom de l'adresse IP publique à rechercher est construit dynamiquement en utilisant le nom de la configuration IP frontale du load balancer AKS.
            - resource_group_name : Similaire à la ressource load balancer, il fait référence au groupe de ressources du cluster AKS.
            - depends_on : Comme pour le load balancer, il y a une dépendance avec le Helm release de Traefik.
- main.tf:
Ce fichier sert de point d'entrée pour définir la structure de base de l'infrastructure dans Azure, en spécifiant le groupe de ressources et le cluster AKS avec ses propriétés nécessaires. Les valeurs exactes pour ces configurations sont déterminées par les variables définies dans le fichier variables.tf.
    1. **Groupe de Ressources Azure** :
       - `resource "azurerm_resource_group" "aks_rg"` : Cette ressource définit le groupe de ressources Azure qui contiendra toutes les ressources liées au cluster Kubernetes.
       - `name` : Utilise une variable `resource_group_name` pour attribuer un nom au groupe de ressources.
       - `location` : La région où le groupe de ressources sera situé est définie par la variable `location`.
    2. **Cluster Kubernetes Azure (AKS)** :
       - `resource "azurerm_kubernetes_cluster" "aks_cluster"` : Crée le cluster AKS en définissant ses caractéristiques et configurations de base.
       - `name` : Le nom du cluster est fourni par la variable `cluster_name`.
       - `location` : Hérite de la localisation définie dans la ressource du groupe de ressources.
       - `resource_group_name` : Référence le nom du groupe de ressources créé précédemment.
       - `dns_prefix` : Un préfixe DNS nécessaire pour le cluster AKS, fourni par la variable `dns_prefix`.
       - `node_resource_group` : Nom du groupe de ressources pour les nœuds, spécifié par la variable `node_resource_group`.
       - `default_node_pool` : Configuration du pool de nœuds par défaut pour le cluster AKS, y compris le nom et le nombre de nœuds.



- variables.tf:
Le fichier variables.tf contient la déclaration des variables utilisées dans le projet Terraform. Ces variables permettent de paramétrer la configuration de l'infrastructure.
    1. Configuration des Ressources
        - `resource_group_name`: Nom du groupe de ressources Azure.
        - `node_resource_group`: Nom du groupe de ressources pour les nœuds du cluster AKS.
    1. Emplacement
        - `location`: Région Azure où les ressources seront déployées.
    1. Configuration du Cluster
        - `cluster_name`: Nom du cluster AKS.
        - `dns_prefix`: Préfixe DNS pour le cluster AKS.
    1. Divers
        - `node_count`: Nombre de nœuds dans le pool de nœuds par défaut.
        - `vm_size`: Taille de la machine virtuelle pour les nœuds du cluster.
        - `enable_auto_scaling`: Activation de l'auto-scaling pour le pool de nœuds.
        - `min_node_count`: Nombre minimal de nœuds pour l'auto-scaling.
        - `max_node_count`: Nombre maximal de nœuds pour l'auto-scaling.
        - `node_os_disk_size_gb`: Taille du disque du système d'exploitation des nœuds.
        - `api_gandi`: Clé d'API pour le provider Gandi.
        - `mail`: Adresse e-mail utilisée pour certains services.
- backend.tf:
Dans mon fichier backend.tf, j'ai défini le strict minimum, sachant que je vais compléter la configuration lors de l'initialisation de Terraform, en suivant les bonnes pratiques telles que décrites dans la documentation GitLab. Cela garantit que je maintiens les informations sensibles hors du contrôle de version tout en configurant mon environnement de manière sécurisée.
    - **Terraform** :
      - `backend "http"` : 
        Je n'ai inclus que la déclaration de base pour un backend HTTP dans ce fichier. Les paramètres détaillés ne sont pas spécifiés ici, car je configure le backend en utilisant la commande `terraform init` conformément aux instructions de la documentation GitLab. Cela me permet de définir des paramètres de backend sensibles et spécifiques à mon environnement directement dans la ligne de commande ou via des variables d'environnement, ce qui est une pratique recommandée pour la sécurité et la flexibilité.


### Services
Déploiement de services comme n8n, Rocket.Chat, Traefik, ainsi que la gestion de bases de données (MongoDB, PostgreSQL).
- n8n.tf:
Dans ce fichier j'ai configuré Terraform pour déployer l'outil d'automatisation des workflows n8n, ainsi qu'une base de données PostgreSQL nécessaire pour n8n.
    1. **Mot de Passe Aléatoire pour PostgreSQL** :
      - `resource "random_password" "passwordn8n"` : 
        - Je génère un mot de passe aléatoire pour la base de données PostgreSQL que n8n utilisera. Ce mot de passe a une longueur de 26 caractères et inclut des caractères spéciaux.
        - `special` : J'autorise l'utilisation de caractères spéciaux.
        - `override_special` : Je définis un ensemble de caractères spéciaux spécifiques qui peuvent être utilisés dans le mot de passe.
    1. **Helm Release pour PostgreSQL** :
      - `resource "helm_release" "postgresql"` : 
        - J'utilise Helm pour déployer PostgreSQL, nécessaire pour le stockage des données de n8n.
        - `name` : Le nom de la release Helm que j'ai choisi est "postgresql".
        - `repository` : J'utilise l'URL du dépôt Helm où se trouve le chart PostgreSQL.
        - `chart` : Le nom du chart Helm à déployer est "postgresql".
        - `values` : Je spécifie un chemin de fichier qui pointe vers mon fichier de valeurs personnalisées pour le chart PostgreSQL (`postgresql.yaml`).
            - global.postgresql.auth.username: 'root'
            - global.postgresql.auth.database: 'n8n'
        - `depends_on` : Je m'assure que PostgreSQL est déployé après le cluster AKS et Traefik.
        - `set` : Je configure le mot de passe pour l'utilisateur PostgreSQL en utilisant le mot de passe généré précédemment.
    1. **Helm Release pour n8n** :
        - `resource "helm_release" "n8n"` :
            - `name` : Je donne un nom spécifique à la release Helm pour n8n.
            - `repository` : Je spécifie l'URL du dépôt Helm contenant le chart n8n.
            - `chart` : Je choisis le chart spécifique pour le déploiement de n8n.
            - `values` : Je fournis un chemin vers un fichier de valeurs personnalisées spécifiques à n8n pour configurer son déploiement selon mes besoins.
               - persistence.enabled: True
               - ingress.enabled: True
                   - annotations.cert-manager.io/cluster-issuer
                   - annotations.traefik.ingress.kubernetes.io/router.tls: Absent dans le fichier par défaut.
                   - hosts: [{'host': 'n8n.grabibel.me', 'paths': ['/']}]
                   - tls: [{'secretName': 'grabibelme-n8n', 'hosts': ['n8n.grabibel.me']}]
                   - className: 'traefik'
               - autoscaling.maxReplicas: 10
            - `depends_on` : Cette ressource peut également avoir des dépendances, comme le cluster AKS, pour s'assurer qu'elle est déployée dans l'ordre approprié.

- rocketchat.tf:
Ce fichier est configuré pour déployer RocketChat dans un environnement Kubernetes en utilisant Terraform et Helm. Il inclut la génération d'un mot de passe sécurisé pour la base de données MongoDB de RocketChat, ainsi que la configuration détaillée du déploiement de RocketChat via une release Helm, en précisant des paramètres comme l'URL du dépôt, le chart Helm, les configurations personnalisées et les dépendances nécessaires.
    1. **Génération d'un Mot de Passe Aléatoire pour MongoDB** :
       - `resource "random_password" "passwordrc"` : 
         - **Length**: 26 - Définissant la longueur du mot de passe généré.
         - **Special**: false - Choix de ne pas inclure de caractères spéciaux.
    2. **Déploiement de RocketChat via Helm** :
       - `resource "helm_release" "rocketchat"` : 
         - **Name**: "rocketchat" - Le nom attribué à la release Helm.
         - **Repository**: "https://rocketchat.github.io/helm-charts" - L'URL du dépôt Helm pour RocketChat.
         - **Chart**: "rocketchat" - Le chart Helm utilisé pour déployer RocketChat.
         - **Values**: Fichier de configuration personnalisé pour RocketChat (`rocketchat.yaml`).
             - persistence.enabled: True
             - ingress.enabled: True
                 - ingressClassName: traefik
                 - annotations.cert-manager.io/cluster-issuer: cert-manager-global
                 - annotations.traefik.ingress.kubernetes.io/router.tls: true
                 - tls:
                     - secretName: grabibelme-rc
                     - hosts: [rocket.grabibel.me]
                - service.nodePort: 30000
         - **Depends_on**: Liste des dépendances pour s'assurer que RocketChat est déployé après le cluster AKS et Traefik.
         - **Set_list** et **Set**: Configurations pour les paramètres de MongoDB, y compris le mot de passe et l'hôte.
         - **Timeout**: 600 - Temps maximum en secondes pour le déploiement de RocketChat.

- traefik.tf:
Cette configuration me permet de mettre en place Traefik comme une solution de gestion du trafic efficace et sécurisée pour mon cluster Kubernetes.
    - Déploiement de Traefik via Helm :
        - J'utilise la ressource `helm_release` pour déployer Traefik.
        - `version = "25.0.0"` : Je spécifie la version du chart Helm de Traefik à utiliser.
        - `name = "traefik" et chart = "traefik"` : Je définis le nom de la release Helm et le nom du chart.
        - repository = "https://traefik.github.io/charts" : J'indique l'URL du dépôt Helm où se trouve le chart Traefik.
        - `values = [file("${path.module}/helm-values/traefik.yaml")]` : Je spécifie le chemin vers un fichier de valeurs personnalisées pour configurer Traefik.
        - `set`: J'utilise cette instruction pour configurer l'email pour Let's Encrypt, en utilisant une variable.
        - `depends_on = [ azurerm_kubernetes_cluster.aks_cluster ]` : Je déclare une dépendance envers mon cluster AKS, pour m'assurer que Traefik est déployé après la création du cluster.
- certificate.tf: Gestion des certificats TLS/SSL.
Cette configuration me permet de gérer automatiquement les certificats SSL pour mes services web, en assurant une connexion sécurisée et la gestion facile des certificats avec Let's Encrypt.

    1. Récupération des Informations de Domaine avec Gandi :
        - J'utilise `data "gandi_livedns_domain" "grabibel_me"` pour récupérer les informations de mon domaine grabibel.me chez Gandi.
    2. Création d'Enregistrements DNS pour n8n et RocketChat :
        - Avec `resource "gandi_livedns_record"`, je crée des enregistrements DNS pour n8n.grabibel.me et rocket.grabibel.me.
        - Ces enregistrements sont de type "A", pointant vers l'adresse IP publique de mon load balancer Traefik sur AKS.
        - Je définis un TTL (Time To Live) de 3600 secondes pour ces enregistrements.
    3. Configuration du Cert Manager :
        - J'utilise le module `cert_manager` pour gérer la création de certificats SSL/TLS pour mes services.
        - `source` : Le module est téléchargé depuis `terraform-iaac/cert-manager/kubernetes`.
        - Je configure l'email de l'émetteur, le nom, et le serveur pour le ClusterIssuer, qui est utilisé par Let's Encrypt pour générer des certificats.
        - Je spécifie les solvers pour le défi HTTP-01, en utilisant Traefik comme ingress.
        - La configuration inclut également le nom et la création du namespace dans Kubernetes.



### Surveillance et Supervision
Utilisation de Prometheus, Grafana, et Loki pour la surveillance des pods et nodes, ainsi que la gestion des logs.
- supervision.tf: 
Cette configuration me permet de mettre en place Loki comme solution de journalisation centralisée dans mon cluster, facilitant la surveillance et l'analyse des logs pour tous les services déployés.
    - Déploiement de Loki pour la Gestion des Logs :
        - J'utilise la ressource `helm_release` pour déployer Loki, une solution de gestion de logs.
        -`name = "loki"` : Le nom de la release Helm pour Loki.
        - `repository = "https://grafana.github.io/helm-charts"` : L'URL du dépôt Helm pour le chart de Loki.
        - `chart = "loki-stack"` : Je choisis le chart "loki-stack" pour déployer Loki ainsi que les composants associés.
        - `create_namespace = true` : Je demande à Helm de créer un espace de noms dans Kubernetes si nécessaire.
        - `values = [file("${path.module}/helm-values/loki_values.yaml")]` : Je spécifie le chemin vers un fichier de valeurs personnalisées pour configurer Loki.
            - grafana.enabled: True
            - grafana.persistence: Présent, avec enabled: True et size: 500Mi
            - prometheus.enabled: True
            - prometheus.alertmanager: Présent, avec persistentVolume: {enabled: True}
            - prometheus.server: Présent, avec persistentVolume: {enabled: True}
        - `depends_on` : Je définis des dépendances pour m'assurer que Loki est déployé après le cluster AKS et Traefik.
        - `timeout = 600` : J'ai défini un délai d'expiration de 600 secondes pour le déploiement de Loki.


### Pipeline CI/CD
Déploiement automatisé via une pipeline GitLab CI, utilisant Terraform et Helm pour orchestrer la création et la mise à jour des ressources.
- <span style="color: #367CB8 ">.gitlab-ci.yml</span> :
Ce fichier est configuré pour automatiser le déploiement et la gestion de mon infrastructure sur Azure, utilisant un pipeline GitLab CI/CD qui intègre Terraform et Azure CLI. Il initialise Terraform, remplace les variables sensibles et applique les configurations de manière sécurisée et automatisée à chaque exécution du pipeline.
    1. Image Docker :
        - Le pipeline utilise l'image Docker personnalisée grabibel/gitlab-terraform-azcli:1.5.5, qui est une image contenant Terraform et Azure CLI basée sur l'image terraform officiel de gitlab.
    1. Étape d'Initialisation :
        - Script : La première étape, nommée initfile, effectue plusieurs opérations d'initialisation : 
            - Configuration du niveau de log de Terraform.
            - Utilisation de sed pour remplacer des placeholders dans providers.tf et main.tf avec des variables d'environnement.
            - Initialisation de Terraform avec des détails spécifiques au backend GitLab.
            - Application de la configuration Terraform avec l'option -auto-approve et passage de variables.

## Coûts
![rJNR3J5PT](https://github.com/G-sarais/Projet_fin_Formation/assets/99554412/6e640587-60fe-47a5-87eb-9edfaafe140c)

Le coût estimé pour le fonctionnement mensuel des services Azure de mon projet est de 192,92 €. Ce budget inclut un cluster Azure Kubernetes Service (AKS) configuré avec un minimum de deux nœuds pour permettre un scaling horizontal selon les besoins, situé dans la région Ouest de l'Europe. La gestion de ce cluster est estimée à 186,52 € mensuellement. Chaque nœud du cluster est équipé de 2 vCPUs A2 v2 et 4 GB de RAM, ce qui représente un choix optimal entre performance et coût pour la base de l'infrastructure.

Pour le stockage, j'ai sélectionné des Managed Disks avec des SSD standards, un choix stratégique pour atteindre un équilibre entre les performances et les coûts, avec un tarif estimatif de 4,01 € par mois. Ce type de disque offre la rapidité requise pour les opérations du projet tout en restant économique.

En termes de connectivité réseau, l'attribution d'une adresse IP statique, essentielle pour la fiabilité des services accessibles, entraîne un coût modeste de 2,39 €.

Le support technique, quant à lui, n'engendre aucun frais supplémentaire dans cette estimation, ce qui permet de maximiser le budget alloué aux ressources opérationnelles.

Cette évaluation financière me permet de planifier efficacement le budget nécessaire pour soutenir un environnement cloud robuste et capable de s'adapter à l'évolution des exigences du projet, tout en respectant les contraintes financières.

# Démarche du projet

La démarche que j'ai adoptée pour ce projet était axée sur la flexibilité, me permettant de m'adapter aux inconnues et aux défis inattendus, particulièrement en raison de l'utilisation d'outils que j'expérimentais pour la première fois. Cette approche agile m'a permis de naviguer efficacement à travers les différentes phases du projet, en gérant l'infrastructure sur Azure, le déploiement d'applications comme Traefik, n8n, RocketChat, Grafana et Prometheus, et l'orchestration de tout cela à travers une pipeline GitLab CI/CD utilisant Terraform et Helm. L'objectif était de rester ouvert aux ajustements nécessaires tout en apprenant et en appliquant de nouvelles technologies pour une mise en œuvre réussie.

## Méthodologie appliquée

### Approche Agile Individuelle :
   - J'ai adopté une méthode de travail agile pour gérer le projet de manière itérative, me concentrant sur les priorités et en m'ajustant aux défis au fur et à mesure de leur apparition. Cette flexibilité m'a été particulièrement bénéfique dans la gestion des tâches inattendues et dans l'apprentissage de nouveaux outils.

### Contrôle des Versions avec Git :
   - L'utilisation de Git pour le contrôle des versions a été un élément clé de ma méthodologie. Cela m'a permis de suivre avec précision toutes les modifications apportées au code et à la configuration, de revenir facilement à des versions antérieures en cas de besoin, et d'intégrer mes changements avec la pipeline CI/CD pour un déploiement automatisé.

### Infrastructure as Code (IaC) :
   - J'ai utilisé Terraform pour définir et provisionner l'infrastructure sur Azure de manière reproductible et automatisée, en m'assurant de la cohérence et de la facilité de gestion de l'infrastructure cloud.

## Outils utilisés

### Git pour le Contrôle de Version :
   - J'ai largement utilisé Git pour la gestion de version, ce qui a facilité le suivi des modifications, la collaboration (même en travaillant seul, cela permet de maintenir un historique clair du projet) et l'intégration avec la pipeline CI/CD.

### Azure & Azure Kubernetes Service (AKS) :
   - Pour l'hébergement de l'infrastructure et la gestion du cluster Kubernetes.

### Terraform & Helm :
   - Terraform pour le provisionnement de l'infrastructure et Helm pour la gestion des applications Kubernetes, en fournissant une méthode structurée et automatisée pour déployer et gérer les applications.


# Réalisations du candidat

## Scripts et configurations développés

### Scripts Terraform pour Azure : 
   - Création de scripts Terraform pour automatiser le déploiement de l'infrastructure Azure, incluant la configuration du groupe de ressources, du cluster AKS, et des services associés.

### Configuration Helm pour Applications Kubernetes : 
   - Écriture de fichiers `values.yaml` pour personnaliser les applications déployées via Kubernetes, adaptées aux exigences de services comme Traefik, n8n, RocketChat, Grafana et Prometheus.
   - Inclusion des ajustements de performance, de sécurité, et d'intégrations spécifiques.

### Pipeline GitLab CI/CD : 
   - Conception d'une pipeline CI/CD , intégrant le backend Terraform, l'application de Terraform et le déploiement des applications Kubernetes.

## Contributions significatives au projet

### Automatisation de l'Infrastructure avec Terraform :
   - Mise en place d'une infrastructure cloud entièrement automatisée, réduisant le temps de déploiement et les erreurs humaines, et permettant une gestion efficace des ressources.

### Intégration et gestion des services Kubernetes :
   - Intégration de services dans le cluster Kubernetes, comme RocketChat pour la communication et Grafana pour le monitoring.

### Optimisation des déploiements avec CI/CD :
   - Création d'un processus de déploiement automatisé et fiable avec la pipeline GitLab CI/CD, permettant des mises à jour régulières des services.

## Argumentation sur les choix techniques

### Azure :
   - Choix d'Azure pour sa compatibilité avec diverses technologies, sa gestion efficace de l'identité, et ses options de sécurité avancées. Azure offre également un accès à de nombreuses technologies sous différentes formes, permettant une plus grande flexibilité dans la construction et la gestion de l'infrastructure.

### AKS (Azure Kubernetes Service) :
   - AKS a été choisi pour sa gestion efficace des ressources Kubernetes et son intégration fluide avec l'écosystème Azure. En tant que solution PaaS, AKS permet de se concentrer sur d'autres détails du projet, en simplifiant la gestion de l'infrastructure Kubernetes et en offrant une plateforme robuste pour le déploiement d'applications.

### Terraform :
  - Terraform est un outil avec lequel j'ai de l'expérience préalable. Sa capacité à gérer l'infrastructure sous forme de code offre une simplification significative de la gestion du projet. Terraform permet également de versionner l'infrastructure, ce qui est crucial pour pouvoir revenir à un état antérieur en cas de besoin, assurant ainsi une meilleure gestion des risques et une plus grande fiabilité.

### Helm :
  - Helm a été choisi pour sa facilité de gestion des déploiements sur Kubernetes. L'utilisation de charts Helm permet de modifier aisément certains aspects des pods. Helm offre également la flexibilité d'utiliser des charts communautaires ou de créer des charts personnalisés, ce qui enrichit les possibilités de déploiement et d'adaptation aux besoins spécifiques du projet.

### GitLab :
- GitLab se distingue par son éventail d'outils dédiés aux DevOps. L'aspect le plus évident est Git, qui facilite la gestion des versions du code à travers des commits, et l'ajout de nouvelles fonctionnalités via des branches. 
- Au-delà de Git, GitLab offre de nombreux autres outils gratuitement. Par exemple, GitLab CI est un système puissant qui permet de lancer des runners publics ou privés pour exécuter du code suite à un commit. Ce code peut servir à effectuer des vérifications de sécurité dans le code ou simplement à compiler du code.
 - GitLab propose également une gestion des secrets, essentielle pour la sécurité, ainsi qu'une gestion du backend Terraform, ce qui rend la plateforme extrêmement utile pour les projets d'infrastructure as code (IaC).

### Prometheus :
  - Choisi pour sa robustesse et sa fiabilité en tant que système de monitoring et d'alerte, Prometheus est aussi apprécié pour son statut de solution open source largement adoptée en entreprise. Sa capacité à collecter et stocker des métriques de manière efficace le rend idéal pour la surveillance en temps réel.

### Grafana :
  - Utilisé pour sa puissante capacité de visualisation des données, Grafana est une solution open source couramment utilisée dans le milieu professionnel. Sa combinaison avec Prometheus offre une vue d'ensemble claire de l'état du système, essentielle pour l'analyse des performances.

### Loki :
  - Loki complète la pile Prometheus-Grafana en fournissant une gestion de logs centralisée et efficace. En tant que solution open source fréquemment utilisée en entreprise, sa conception légère et sa compatibilité avec Grafana-Prometheus en font un choix privilégié pour l'agrégation et l'analyse des logs.

### Traefik
  - J'ai choisi Traefik en raison de sa facilité d'intégration avec les conteneurs et Kubernetes. Traefik se distingue par sa capacité à automatiser la découverte de services et à simplifier la configuration des routes.
  - L'un des principaux avantages de Traefik est sa capacité à gérer le trafic entrant de manière dynamique et efficace, ce qui est crucial pour des services en ligne évolutifs. Traefik facilite également la mise en place de SSL/TLS, améliorant ainsi la sécurité des communications.
  - L'intégration de Traefik dans le projet a permis une gestion fluide du trafic réseau vers les diverses applications déployées sur le cluster Kubernetes, assurant ainsi une distribution équilibrée de la charge et une haute disponibilité des services.

# Investigation Technique et Résolution de Problèmes

## Résolution d'un Défi Technique Spécifique

### Extraction Complexifiée de l'IP Publique dans Azure pour Traefik : 
  - Dans le cadre de mon projet, j'ai été confronté à un problème particulier : la nécessité d'extraire l'adresse IP publique attribuée automatiquement à Traefik dans l'environnement Azure. La complexité résidait dans le fait que cette adresse IP n'était pas directement accessible en tant qu'output des ressources Terraform standard.

## Méthodologie de recherche

### Recherche Approfondie et Expérimentation :
  - Ma première étape a été de mener une recherche approfondie, explorant la documentation officielle de Terraform et Azure, ainsi que les forums de développeurs et les ressources en ligne pour des cas similaires.
  - Après avoir étudié plusieurs stratégies, j'ai conçu un plan en deux étapes utilisant les ressources de données Terraform :
    - **Extraction de l'ID de l'IP Publique** : J'ai d'abord créé une ressource de données Terraform pour récupérer l'identifiant unique (ID) de l'adresse IP publique associée au load balancer déployé pour Traefik.
    - **Requête Azure pour l'Adresse IP** : En utilisant l'ID obtenu, j'ai ensuite configuré une seconde ressource de données pour interroger directement Azure et récupérer l'adresse IP effective.

## Résultats et application au projet

### Implémentation Réussie et Avantages :
  - L'implémentation de cette solution a abouti à la récupération réussie de l'adresse IP publique, un élément crucial pour configurer correctement les routes réseau et les règles de sécurité.
  - Cette résolution a non seulement adressé le besoin spécifique lié à Traefik mais a également renforcé ma compréhension et mes compétences en matière de manipulation des ressources cloud Azure avec Terraform. Elle a démontré l'importance d'une approche flexible et créative face aux défis techniques.


# Conclusion
## Synthèse des compétences développées

- **Automatiser le déploiement d'une infrastructure dans le cloud** :
  - **Automatisation de la Création de Serveurs** : Utilisation de scripts Terraform pour automatiser la création et la configuration de serveurs dans le cloud Azure.
  - **Déploiement Automatisé de l'Infrastructure** : Déploiement d'un cluster Kubernetes et de Traefik pour la gestion du trafic et du load balancing.
  - **Sécurisation de l'Infrastructure** : Mise en place du TLS, sécurisation des mots de passe des bases de données avec une approche de no Trust et gestion des secrets pour éviter leur exposition dans le code.
  - **Mise en Production dans le Cloud** : Déploiement réussi de l'infrastructure sur Azure AKS, assurant un fonctionnement optimal et sécurisé de l'ensemble des services.

- **Déployer en continu une application** :
  - **Gestion du Stockage des Données** : Déploiement de solutions de stockage persistant pour la rétention des données des pods.
  - **Gestion de Containers avec Kubernetes** : Utilisation de Kubernetes pour gérer les containers, facilitant le déploiement et la maintenance des applications.
  - **Automatisation de la Mise en Production** : Intégration de GitLab CI/CD pour automatiser le déploiement continu des applications dans l'environnement de production.

- **Superviser les services déployés** :
  - **Mise en Place de Statistiques de Services** : Définition et mise en œuvre de dashboards sur Grafana pour surveiller les performances des services.
  - **Exploitation d'une Solution de Supervision** : Utilisation de Grafana et Prometheus pour superviser et analyser l'état des services déployés dans le cloud.

## Retour sur expérience

Je suis parti avec l'idée d'utiliser des outils que je n'avais pas l'habitude d'utiliser au travail et pour lesquels j'avais peu de formation, afin de m'ouvrir à des alternatives. Durant ce projet, j'ai pu mettre en pratique de nombreuses techniques que je n'avais pas l'occasion de voir en entreprise, ainsi que des outils que je ne croisais qu'en formation.

Par exemple, j'avais déjà utilisé Terraform à plusieurs reprises, mais jamais dans le cadre d'un projet aussi complet. Cette expérience m'a permis de mieux comprendre certains aspects comme le backend ou l'utilisation des ressources de données (data).

Certains choix que j'ai faits m'ont fait perdre du temps, mais ils m'ont aussi apporté une expérience précieuse. J'aurais pu opter pour Azure Monitor, qui peut être très facilement intégré à AKS et que j'utilise quotidiennement au travail. Cependant, l'utilisation de Grafana et Prometheus m'a offert une alternative intéressante.

Si j'avais à refaire ce projet, il y aurait beaucoup de choses que je ferais différemment, grâce à l'expérience acquise et pour gagner du temps. Mais dans l'ensemble, j'ai réussi à atteindre mes objectifs principaux.

## Perspectives d'évolution du projet
![HJyPZ6KD6](https://github.com/G-sarais/Projet_fin_Formation/assets/99554412/f93550f0-d85c-4256-a335-59add56308bd)


### Amélioration du Dashboard Grafana :
  - Intégrer un runner GitLab directement dans le cluster pour une meilleure gestion et mise à jour des dashboards Grafana.
  - Utiliser des `ConfigMap` pour déployer des dashboards Grafana.
  - Employer le Helm chart de Grafana pour une configuration plus dynamique et modulable des dashboards dans le template Terraform.

### Backup des Bases de Données :
  - Mettre en place un système de backup automatisé pour les bases de données, en utilisant des storage accounts Azure pour un stockage sécurisé et fiable.

### Déploiement Automatisé du Backup de la Base de Données :
  - Automatiser le déploiement des backups de la base de données via un runner GitLab implanté dans le cluster, assurant ainsi une restauration rapide et efficace en cas de besoin.

### Création de Helm Charts Personnalisés :
  - Développer des Helm Charts personnalisés, afin de faciliter leur déploiement et d'avoir une granularité plus fine sur les options lors du déploiement.

### Intégration du SSO (Single Sign-On) :
  - Ajouter une couche d'authentification SSO pour renforcer la sécurité et simplifier l'accès aux différentes applications et services.

### Ajout de Tests dans la Pipeline CI/CD :
  - Intégrer des tests de charge pour évaluer la performance et la capacité des services sous des charges élevées.
  - Implémenter des tests OWASP pour assurer la sécurité des applications contre les vulnérabilités web courantes.

### Mise en Place de Canary Releases :
  - Adopter une stratégie de déploiement en canary release pour introduire progressivement de nouvelles fonctionnalités, permettant une transition plus douce et une réduction des risques.

# Annexes
## N8N
![SkbHK0FDa](https://github.com/G-sarais/Projet_fin_Formation/assets/99554412/7a8512af-bc89-4e89-a15d-b99641b880ab)
![rJM1cAKwT](https://github.com/G-sarais/Projet_fin_Formation/assets/99554412/f09f96b8-41bf-4013-a80b-7a90bc14800f)

## Rocket.chat

![HJW490tPT](https://github.com/G-sarais/Projet_fin_Formation/assets/99554412/7a92034e-47ba-4da1-af0c-cb9d68f8d090)

## Pipeline
```
image:
    name: "grabibel/gitlab-terraform-azcli:1.5.5"
initfile:
    script:
        - export TF_LOG=WARN
        - sed -i -e 's/<azure_subscription_id>/'$subscription_id'/g' -e 's/<service_principal_password>/'$client_secret'/g' -e 's/<azure_subscription_tenant_id>/'$tenant_id'/g' -e 's/<service_principal_appid>/'$client_id'/g' ./terraform/providers.tf
        - sed -i -e 's/<service_principal_password>/'$client_secret'/g' -e 's/<service_principal_appid>/'$client_id'/g' ./terraform/main.tf
        - terraform -chdir=./terraform init -backend-config=address=https://gitlab.com/api/v4/projects/$filtoken/terraform/state/tf_state -backend-config=lock_address=https://gitlab.com/api/v4/projects/$filtoken/terraform/state/tf_state/lock -backend-config=unlock_address=https://gitlab.com/api/v4/projects/$filtoken/terraform/state/tf_state/lock -backend-config=username=$filusername -backend-config=password=$filpw -backend-config=lock_method=POST -backend-config=unlock_method=DELETE -backend-config=retry_wait_min=5 --reconfigure
        - terraform -chdir=./terraform apply -auto-approve -var="api_gandi=$apigandi"
        - az login --service-principal -u $client_id -p $client_secret --tenant $tenant_id
```
## Terraform
### Provider.tf
```
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
```
### main.tf
```
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
```
### data.tf
```
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
```
### n8n.tf
```
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
}
# https://artifacthub.io/packages/helm/open-8gears/n8n
```
### rocketchat.tf
```
resource "random_password" "passwordrc" {
  length           = 26
  special          = false
}

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
```
### supervision.tf
```
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
```
### traefik.tf
```
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
```
### certificate.tf
```
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

  cluster_issuer_email                   = var.mail
  cluster_issuer_name                    = "cert-manager-global"
  cluster_issuer_server                  = "https://acme-v02.api.letsencrypt.org/directory"
  solvers                                = [ { "http01": { "ingress": { "class": "traefik" } } } ]
  namespace_name                         = "default"
  create_namespace                       = false
}
```
