resource "google_pubsub_topic" "topics" {
  count = length(var.topic_names)

  name = var.topic_names[count.index]
}

output "topic_names" {
  value = google_pubsub_topic.topics[*].name
}
