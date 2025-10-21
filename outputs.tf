output "db_event_subscription_arn" {
  value = aws_db_event_subscription.db_event_subscription.arn
}

output "db_event_sns_topic_arn" {
  value = aws_sns_topic.db_events.arn
}