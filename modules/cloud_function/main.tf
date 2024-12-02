  resource "google_storage_bucket" "function_source_bucket" {
  name          = "${var.bucket_name}"
  location      = var.region
  force_destroy = var.force_destroy
}

resource "google_storage_bucket_object" "function_source_archives" {
  for_each = var.functions

  name   = each.value.source_file
  bucket = google_storage_bucket.function_source_bucket.name
  source = each.value.source_path
}

resource "google_cloudfunctions_function" "pubsub_functions" {
  for_each = var.functions

  name        = each.value.name
  runtime     = "python310"
  entry_point = each.value.entry_point
  region      = var.region
  service_account_email = var.service_account_email

  available_memory_mb   = 256
  timeout               = 300
  source_archive_bucket = google_storage_bucket.function_source_bucket.name
  source_archive_object = google_storage_bucket_object.function_source_archives[each.key].name
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = each.value.topic_name
  }
}

output "function_names" {
  value = [for func in google_cloudfunctions_function.pubsub_functions : func.name]
}
