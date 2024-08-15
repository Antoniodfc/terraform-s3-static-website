# Static Website Portfolio with AWS S3

Prérequis :

1. Création d'un utilisateur IAM
Avant de commencer, assurez-vous d'avoir créé un utilisateur IAM avec les permissions nécessaires pour gérer des ressources S3 et Terraform.

2. Installation de Homebrew
Installez Homebrew, le gestionnaire de paquets pour macOS et Linux :
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
3. Installation d'AWS CLI
Installez l'AWS CLI pour interagir avec les services AWS depuis la ligne de commande :
```
# Étape 1 : Installer AWS CLI
brew install awscli
brew install python3
brew install python-tk@3.9

# Étape 2 : Vérifier l'installation
aws --version

# Étape 3 : Configurer AWS CLI
aws configure
# Entrez votre Access Key ID et Secret Access Key
Access Key ID: YOUR_ACCESS_ID
Secret Access Key: YOUR_SECRET_KEY
```
4. Installation de Terraform
Installez Terraform, l'outil d'infrastructure en tant que code :
```
# Installer Terraform
brew install terraform
# Vérifier l'installation
terraform -v
```

# Mettre à jour Terraform (optionnel)
```
brew upgrade terraform
```
## Étape 1 - Création des Ressources
Structure du Projet
Voici la structure du projet qui sera utilisée pour déployer votre site web statique sur AWS S3 :

```
/s3staticwebsite-github-project/
├── main.tf          # Fichier principal de configuration Terraform
├── variables.tf     # Variables utilisées dans Terraform
├── provider.tf      # Configuration du fournisseur AWS
├── outputs.tf       # Sorties des ressources créées par Terraform

/s3staticwebsite-github-project/website
├── index.html       # Page d'accueil du site
├── error.html       # Page d'erreur du site
├── script.js        # Script JavaScript pour la dynamique du site
├── styles.css       # Fichier CSS pour le style du site
```

Exécution et Création des Ressources
Planifiez l'exécution :

Cette commande montre un aperçu des actions qui seront effectuées par Terraform.
```
terraform plan
```
Appliquez la configuration :

Cette commande crée les ressources décrites dans vos fichiers .tf.
```
terraform apply
```
Vérification :

Une fois la commande exécutée, le bucket S3 et d'autres ressources associées seront créés. Vous devriez voir une confirmation indiquant la création du bucket.
## Étape 2 - Accéder aux Ressources
Accéder au bucket S3 :

Allez sur la console AWS S3 : Amazon S3 Console
Recherchez le bucket nommé github-s-w-bucket (ou le nom que vous avez utilisé dans vos fichiers Terraform).
Configurer les propriétés du bucket :

Cliquez sur l'onglet Propriétés du bucket.
Faites défiler vers le bas jusqu'à la section Hébergement de site web statique et cliquez sur le lien pour accéder à votre site web.
