resource "google_cloud_scheduler_job" "pubsub_jobs" {
  for_each = var.jobs

  name        = each.value.name
  description = each.value.description
  schedule    = each.value.schedule
  time_zone   = each.value.time_zone

  pubsub_target {
    topic_name = "projects/${var.project_id}/topics/process-source-topic-test"
    data       = base64encode(jsonencode(each.value.payload))
  }
}

output "job_names" {
  value = [for job in google_cloud_scheduler_job.pubsub_jobs : job.name]
}
