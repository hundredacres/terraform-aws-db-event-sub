provider "aws" {
  region = "us-east-1"
}

module "db_event_subscription" {
  source = "git::https://github.com/hundredacres/terraform-aws-db-event-sub.git?ref=main"

  notification_email = "dba-team@example.com"
}
