provider "google" {
  project     = var.project_id
  credentials = file("${path.root}/poc1keys.json")
  region      = var.region
}
