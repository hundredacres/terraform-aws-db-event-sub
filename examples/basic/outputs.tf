output "subscription_arn" {
  description = "ARN of the RDS event subscription"
  value       = module.db_event_subscription.db_event_subscription_arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.db_event_subscription.db_event_sns_topic_arn
}
