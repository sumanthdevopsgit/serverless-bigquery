variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
}

variable "service_account_email" {
  description = "Service account email for Cloud Function"
  type        = string
}

variable "bucket_name" {
  description = "GCS bucket name for Cloud Function source code"
  type        = string
}

variable "functions" {
  description = "Map of Cloud Functions configurations"
  type = map(object({
    name        = string
    source_file = string
    source_path = string
    entry_point = string
    topic_name  = string
  }))
}

variable "force_destroy" {
  description = "Storage bucket force destroy"
  type        = string
}
