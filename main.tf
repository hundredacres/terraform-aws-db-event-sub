resource "aws_sns_topic" "db_events" {
  name = var.db_events_sns_topic_name
  tags = var.tags
}

resource "aws_db_event_subscription" "db_event_subscription" {
  name_prefix      = "db-event-sub-"
  sns_topic        = aws_sns_topic.db_events.arn
  source_type      = var.source_type
  source_ids       = var.source_ids
  event_categories = var.event_categories
  enabled          = true
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.db_events.arn
  protocol  = "email"
  endpoint  = var.notification_email
}