# Static web-site Portfolio with S3

Prerequis :

- Create IAM user
- Install brew :

```jsx
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Installer awscli

```jsx
# Step - 1 
brew install awscli
brew install python3
brew install python-tk@3.9

# Step - 2 : Verifier l'installation
aws --version

# Step - 3 : Entrer le Access ID et Aceess KEY
aws configure 
Access_ID : YOUR_ACCESS_ID
Access_KEY : YOUR_KEY

```

- Installer terraform

```jsx
brew install terraform
terraform -v
brew upgrade terraform
```

 

## Step 1  - Creation des ressources:

Structure

```
/s3staticwebsite-github-project/
├── main.tf
├── variables.tf
├── provider.tf
├── outputs.tf

/s3staticwebsite-github-project/website
├── index.html
├── errors.html
├── script.js
├── styles.css
```

Execution et création des ressources

```jsx
terraform plan
terraform apply
```

le bucket a ete creé

aws_s3_bucket_acl

## Step 2 - Acceder aux ressources 

1. Amazon S3 > Compartiments > github-s-w-bucket`
2. Cliquez sur l'onglet proprietés
3. Allez en bas de page et cliquez sur le lien
