resource "google_bigquery_dataset" "autozone_dataset" {
  project    = var.project_id
  dataset_id = var.dataset_id
  location   = var.region 
}
