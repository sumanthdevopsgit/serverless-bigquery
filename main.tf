module "bigquery" {
  source     = "./modules/bigquery"
  project_id = var.project_id
  region     = var.region
  dataset_id = var.dataset_id
}

module "pubsub" {
  source      = "./modules/pubsub"
  project_id  = var.project_id
  topic_names = var.topic_names
}

output "created_topics" {
  value = module.pubsub.topic_names
}

module "scheduler" {
  source     = "./modules/scheduler"
  project_id = var.project_id
  jobs       = var.jobs
}

output "scheduler_job_names" {
  value = module.scheduler.job_names
}
# To start the function automatically.
# resource "null_resource" "trigger_scheduler_job" {
#   provisioner "local-exec" {
#     command = "gcloud scheduler jobs run ${module.scheduler.job_name} --location=${var.region}"
#   }

#   # Ensure this runs after the scheduler job is created
#   depends_on = [module.scheduler]
# }

module "cloud_function" {
  source                = "./modules/cloud_function"
  project_id            = var.project_id
  region                = var.region
  service_account_email = var.service_account_email
  bucket_name           = var.bucket_name
  functions             = var.functions
  force_destroy         = var.force_destroy
}

output "cloud_function_names" {
  value = module.cloud_function.function_names
}


module "cloudsql_instances" {
  source = "./modules/cloud-sql"
  count  = length(var.sql_instances)

  project_id        = var.project_id
  instance_name     = var.sql_instances[count.index].name
  database_version  = var.sql_instances[count.index].database_version
  region            = var.region
  tier              = var.sql_instances[count.index].tier
  activation_policy = var.sql_instances[count.index].activation_policy
  enable_ipv4       = var.sql_instances[count.index].enable_ipv4
  sql_user_name     = var.sql_instances[count.index].sql_user_name
  sql_user_password = var.sql_instances[count.index].sql_user_password
}

