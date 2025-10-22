provider "aws" {
  region = "us-east-1"
}

module "db_event_subscription" {
  source = "../../"

  notification_email = "dba-team@example.com"
}
