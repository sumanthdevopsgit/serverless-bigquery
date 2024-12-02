resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  project          = var.project_id
  database_version = var.database_version
  region           = var.region

  settings {
    tier                  = var.tier
    activation_policy     = var.activation_policy
    edition                   = "ENTERPRISE"
    
    ip_configuration {
      ipv4_enabled = var.enable_ipv4
    }
    disk_type        = "PD_HDD"
    disk_size     = 10
  }
}

resource "google_sql_user" "default_user" {
  name       = var.sql_user_name
  password   = var.sql_user_password
  project    = var.project_id
  instance   = google_sql_database_instance.default.name
  depends_on = [google_sql_database_instance.default]
}
