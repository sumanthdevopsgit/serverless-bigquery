project_id            = "cs-host-250323f4c1e749beab0804"
region                = "asia-south1"
service_account_email = "terraform-poc1@cs-host-250323f4c1e749beab0804.iam.gserviceaccount.com"
dataset_id            = "dataset_test"
topic_names = [
  "process-source-topic-test",
  "populate-bigquery-topic-test"
]
force_destroy = "true"


jobs = {
  customers = {
    name        = "customers-scheduler-job-test"
    description = "Job to trigger customer-related Pub/Sub messages periodically"
    schedule    = "*/30 * * * *"
    time_zone   = "Asia/Kolkata"
    payload = {
      "project_id" : "cs-host-250323f4c1e749beab0804",
      "db_host" : "35.200.158.52",
      "db_user" : "innominds",
      "db_password" : "Innominds@123",
      "db_name" : "customerdb",
      "table_name" : "customers",
      "operation" : "fetch",
      "second_topic" : "populate-bigquery-topic-test",
      "fetch_all" : false
    }
  }
  orders = {
    name        = "orders-scheduler-job-test"
    description = "Job to trigger order-related Pub/Sub messages periodically"
    schedule    = "*/30 * * * *"
    time_zone   = "Asia/Kolkata"
    payload = {
      "project_id" : "cs-host-250323f4c1e749beab0804",
      "db_host" : "35.200.158.52",
      "db_user" : "innominds",
      "db_password" : "Innominds@123",
      "db_name" : "productdb",
      "table_name" : "products",
      "operation" : "fetch",
      "second_topic" : "populate-bigquery-topic-test",
      "fetch_all" : false
    }
  }
  products = {
    name        = "products-scheduler-job-test"
    description = "Job to trigger product-related Pub/Sub messages periodically"
    schedule    = "*/30 * * * *"
    time_zone   = "Asia/Kolkata"
    payload = {
      "project_id" : "cs-host-250323f4c1e749beab0804",
      "db_host" : "35.200.158.52",
      "db_user" : "innominds",
      "db_password" : "Innominds@123",
      "db_name" : "orderdb",
      "table_name" : "orders",
      "operation" : "fetch",
      "second_topic" : "populate-bigquery-topic-test",
      "fetch_all" : false
    }
  }
}
sql_instances = [
  {
    name              = "customers1"
    database_version  = "MYSQL_8_4"
    tier              = "db-n1-standard-1"
    activation_policy = "ALWAYS"
    enable_ipv4       = true
    sql_user_name     = "innominds"
    sql_user_password = "Innominds@123"
  },
  {
    name              = "products1"
    database_version  = "MYSQL_8_4"
    tier              = "db-n1-standard-1"
    activation_policy = "ALWAYS"
    enable_ipv4       = true
    sql_user_name     = "innominds"
    sql_user_password = "Innominds@123"
  },
  {
    name              = "orders1"
    database_version  = "MYSQL_8_4"
    tier              = "db-n1-standard-1"
    activation_policy = "ALWAYS"
    enable_ipv4       = true
    sql_user_name     = "innominds"
    sql_user_password = "Innominds@123"
  }
]
bucket_name = "terraform-autozone-test-cloud-functions"

functions = {
  process_source_db = {
    name        = "process-source-db1test"
    source_file = "python.zip"
    source_path = ".\\python.zip"
    entry_point = "main"
    topic_name  = "process-source-topic-test"
  }
  populate_bigquery = {
    name        = "populate-bigquery-1test"
    source_file = "python1.zip"
    source_path = ".\\python1.zip"
    entry_point = "hello_pubsub"
    topic_name  = "populate-bigquery-topic-test"
  }
}