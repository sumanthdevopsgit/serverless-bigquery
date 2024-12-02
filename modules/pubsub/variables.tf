variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "topic_names" {
  description = "List of Google Cloud Pub/Sub Topic names"
  type        = list(string)
}
