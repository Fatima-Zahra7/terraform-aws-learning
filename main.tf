# 1. On déclare quel provider (fournisseur cloud) on utilise, et sa version.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. On configure le provider AWS : la région où créer les ressources.
provider "aws" {
  region = "eu-west-3" # Paris
}

# 3. On crée une ressource : ici un bucket S3 (stockage d'objets).
resource "aws_s3_bucket" "mon_premier_bucket" {
  bucket = var.premier_variable # Nom unique du bucket
}

# 4. On active la versioning sur le bucket S3 créé ci-dessus.
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.mon_premier_bucket.id # ← on référence le bucket au-dessus
  versioning_configuration {
    status = "Enabled"
  }
}

