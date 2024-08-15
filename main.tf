resource "aws_s3_bucket" "github_s_w_bucket" {
  bucket = "github-s-w-bucket"

  # Activer l'hébergement de site web statique
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "s3swb_aws_s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.github_s_w_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3swb_aws_s3_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.github_s_w_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3swb_aws_s3_bucket_acl" {
  bucket = aws_s3_bucket.github_s_w_bucket.id
  acl    = "public-read"  # Modification pour permettre l'accès public
}


# Téléchargement des fichiers HTML
resource "aws_s3_object" "index" {
  bucket        = aws_s3_bucket.github_s_w_bucket.id
  key           = "index.html"
  source        = "index.html"
  acl           = "public-read"
  content_type  = "text/html"
}

# Téléchargement du fichier CSS
resource "aws_s3_object" "style" {
  bucket        = aws_s3_bucket.github_s_w_bucket.id
  key           = "styles.css"
  source        = "styles.css"
  acl           = "public-read"
  content_type  = "text/css"
}

# Téléchargement du fichier JavaScript
resource "aws_s3_object" "script" {
  bucket       = aws_s3_bucket.github_s_w_bucket.id
  key          = "script.js"
  source       = "script.js"
  acl           = "public-read"
  content_type = "application/javascript"
}

# Téléchargement des actifs (images, fonts, etc.) dans un dossier 'assets'
resource "aws_s3_bucket_object" "assets" {
  for_each     = fileset("assets/", "**/*.*")
  bucket       = aws_s3_bucket.github_s_w_bucket.id
  key          = "assets/${each.value}"
  source       = "assets/${each.value}"
  acl          = "public-read"
  content_type = lookup(var.mime_types, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
}

resource "aws_s3_object" "error" {
  bucket        = aws_s3_bucket.github_s_w_bucket.id
  key           = "error.html"
  source        = "error.html"
  acl           = "public-read"
  content_type  = "text/html"
}

# Variable pour les types MIME
variable "mime_types" {
  type = map(string)
  default = {
    html = "text/html"
    css  = "text/css"
    js   = "application/javascript"
    png  = "image/png"
    jpg  = "image/jpeg"
    jpeg = "image/jpeg"
    gif  = "image/gif"
    svg  = "image/svg+xml"
    ico  = "image/vnd.microsoft.icon"
    # Ajouter d'autres types MIME si nécessaire
  }
}
