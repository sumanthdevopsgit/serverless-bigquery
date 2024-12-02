variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "database_version" {
  description = "Database version for the Cloud SQL instance"
  type        = string
}

variable "region" {
  description = "Region for the Cloud SQL instance"
  type        = string
  default     = "us-central1"
}

variable "tier" {
  description = "Machine type for the Cloud SQL instance"
  type        = string
}

variable "activation_policy" {
  description = "Activation policy for the instance"
  type        = string
}

variable "enable_ipv4" {
  description = "Enable IPv4 for the instance"
  type        = bool
}

variable "sql_user_name" {
  description = "Name of the default SQL user"
  type        = string
}

variable "sql_user_password" {
  description = "Password for the default SQL user"
  type        = string
}
