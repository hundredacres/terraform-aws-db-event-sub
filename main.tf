resource "aws_sns_topic" "db_events" {
  name = "db-event-notifications"
}

resource "aws_db_event_subscription" "db_event_subscription" {
  name_prefix   = "db-event-sub-"
  sns_topic     = aws_sns_topic.db_events.arn
  source_type   = var.source_type
  source_ids    = var.source_ids
  event_categories = [
    "availability",
    "backup",
    "configuration",
    "deletion",
    "failover",
    "low-storage",
    "maintenance",
    "notification",
    "read-replica",
    "recovery",
    "restoration"
  ]
  # Optionally, filter by specific source identifiers
  # source_ids = [aws_db_instance.my_rds_instance.id]
  enabled = true
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.db_events.arn
  protocol  = "email"
  endpoint  = var.notification_email
}