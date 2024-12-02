variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}


variable "jobs" {
  description = "List of scheduler jobs with their configurations"
  type = map(object({
    name        = string
    description = string
    schedule    = string
    time_zone   = string
    payload     = map(string)
  }))
}
