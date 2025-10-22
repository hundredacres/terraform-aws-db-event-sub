output "db_event_subscription_arn" {
  description = "ARN of the RDS event subscription"
  value       = aws_db_event_subscription.db_event_subscription.arn
}

output "db_event_sns_topic_arn" {
  description = "ARN of the SNS topic for database events"
  value       = aws_sns_topic.db_events.arn
}