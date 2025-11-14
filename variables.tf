variable "minio_server" {
  description = "MinIO endpoint"
  type        = string
}

variable "minio_user" {
  description = "MinIO username"
  type        = string
}

variable "minio_password" {
  description = "MinIO password"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Nom du bucket"
  type        = string
  default     = "mon-bucket-demo"
}