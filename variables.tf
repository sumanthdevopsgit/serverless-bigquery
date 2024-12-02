variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
}

variable "jobs" {
  description = "Map of scheduler job configurations"
  type = map(object({
    name        = string
    description = string
    schedule    = string
    time_zone   = string
    payload     = map(string)
  }))
}
variable "service_account_email" {
  description = "Service account email for Cloud Function"
  type        = string
}

variable "bucket_name" {
  description = "GCS bucket name for Cloud Function source code"
  type        = string
}

variable "job_name" {
  description = "Name of the Cloud Scheduler job"
  type        = string
  default     = "autozone-scheduler-job"
}

variable "dataset_id" {
  description = "Dataset ID"
  type        = string
}

variable "topic_names" {
  description = "List of Google Cloud Pub/Sub Topic names"
  type        = list(string)
}


variable "force_destroy" {
  description = "Storage bucket force destroy"
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

variable "sql_instances" {
  description = "List of Cloud SQL instance configurations"
  type = list(object({
    name              = string
    database_version  = string
    tier              = string
    activation_policy = string
    enable_ipv4       = bool
    sql_user_name     = string
    sql_user_password = string
  }))
}