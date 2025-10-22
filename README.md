# Terraform AWS DB Event Subscription

A Terraform module to create AWS RDS event subscriptions with SNS notifications via email. This module monitors RDS database events and sends email notifications when events occur.

## Features

- Creates an SNS topic for RDS event notifications
- Sets up RDS event subscription with configurable event categories
- Configures email subscription for receiving notifications
- Supports filtering by source type and specific database identifiers

## Usage

```hcl
module "db_event_subscription" {
  source = "github.com/yourusername/terraform-aws-db-event-sub"

  notification_email = "admin@example.com"
  source_type        = "db-instance"
  source_ids         = ["my-rds-instance"]

  event_categories = [
    "availability",
    "backup",
    "failover",
    "maintenance"
  ]
}
```

### Basic Example

Monitor all RDS instances with default event categories:

```hcl
module "db_event_subscription" {
  source = "github.com/yourusername/terraform-aws-db-event-sub"

  notification_email = "dba-team@example.com"
}
```

### Specific Database Instance

Monitor a specific RDS instance:

```hcl
module "db_event_subscription" {
  source = "github.com/yourusername/terraform-aws-db-event-sub"

  notification_email = "alerts@example.com"
  source_type        = "db-instance"
  source_ids         = [aws_db_instance.primary.id]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| notification_email | Email address to subscribe to RDS event notifications | `string` | n/a | yes |
| source_type | The type of source that will generate the events. Valid values: db-instance, db-parameter-group, db-security-group, db-snapshot | `string` | `"db-instance"` | no |
| source_ids | List of identifiers of the event sources for which events are returned. If omitted, events are returned for all sources of the specified source type | `list(string)` | `[]` | no |
| event_categories | List of event categories for the event subscription | `list(string)` | See below | no |

### Default Event Categories

By default, the following event categories are monitored:
- `availability`
- `backup`
- `configuration`
- `deletion`
- `failover`
- `low-storage`
- `maintenance`
- `notification`
- `read-replica`
- `recovery`
- `restoration`

## Outputs

| Name | Description |
|------|-------------|
| db_event_subscription_arn | ARN of the RDS event subscription |
| db_event_sns_topic_arn | ARN of the SNS topic for database events |

## Email Subscription Confirmation

After applying this module, AWS will send a confirmation email to the specified address. You must confirm the subscription by clicking the link in the email to start receiving notifications.

## Event Categories Reference

Available event categories depend on the source type:

### db-instance
- availability
- backup
- configuration change
- creation
- deletion
- failover
- failure
- low storage
- maintenance
- notification
- read replica
- recovery
- restoration

### db-parameter-group
- configuration change

### db-security-group
- configuration change
- failure

### db-snapshot
- creation
- deletion
- failure
- notification
- restoration

## Development

This module uses pre-commit hooks to maintain code quality and automatically update documentation.

### Setup Pre-commit Hooks

1. Install pre-commit:
   ```bash
   # macOS
   brew install pre-commit

   # or using pip
   pip install pre-commit
   ```

2. Install the git hooks:
   ```bash
   pre-commit install
   ```

3. (Optional) Run against all files:
   ```bash
   pre-commit run -a
   ```

The pre-commit hooks will automatically:
- Format Terraform code with `terraform fmt`
- Update README.md documentation with `terraform-docs`
- Validate Terraform configuration
- Run `tflint` for best practices and potential issues

### Manual Documentation Update

If you need to manually update the documentation:
```bash
terraform-docs markdown table . --output-file README.md --output-mode inject
```

## License

MIT

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.
