output "bucket_name" {
  description = "Nom du bucket MinIO"
  value       = minio_s3_bucket.web_bucket.bucket
}

output "index_url" {
  description = "URL publique de index.html"
  value       = "http://${var.minio_server}/${minio_s3_bucket.web_bucket.bucket}/index.html"
}

output "style_url" {
  description = "URL publique de style.css"
  value       = "http://${var.minio_server}/${minio_s3_bucket.web_bucket.bucket}/style.css"
}