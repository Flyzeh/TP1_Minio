terraform {
  required_providers {
    minio = {
      source  = "terraform-provider-minio/minio"
      version = ">= 3.1.0"
    }
  }
}

provider "minio" { 
  minio_server   = var.minio_server
  minio_user     = var.minio_user
  minio_password = var.minio_password
}

resource "minio_s3_bucket" "web_bucket" { 
  bucket = var.bucket_name
  acl    = "private"
}

resource "minio_s3_bucket_policy" "public_files" {
  bucket = minio_s3_bucket.web_bucket.bucket
  policy = file("public_policy.json")
}

resource "minio_s3_object" "index_html" {
  bucket_name  = minio_s3_bucket.web_bucket.bucket
  object_name  = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "minio_s3_object" "style_css" {
  bucket_name  = minio_s3_bucket.web_bucket.bucket
  object_name  = "style.css"
  source       = "style.css"
  content_type = "text/css"
}