# Specific Database Instance Example

This example demonstrates monitoring a specific RDS database instance with custom event categories. It creates a complete RDS setup including VPC, subnets, security group, and the database instance itself.

## Features

- Creates a PostgreSQL RDS instance
- Monitors only that specific instance (not all instances)
- Configures custom event categories (only critical events)
- Includes complete VPC and networking setup

## Usage

To run this example:

```bash
terraform init
terraform plan
terraform apply
```

After applying:
1. You will receive a confirmation email at the specified address
2. Confirm the subscription to start receiving notifications
3. Only events from the specific database instance will trigger notifications

## What This Creates

- VPC with two subnets across two availability zones
- Security group for database access
- PostgreSQL RDS instance (db.t3.micro)
- SNS topic for RDS events
- RDS event subscription monitoring the specific instance
- Email subscription to the SNS topic

## Event Categories

This example only monitors critical events:
- `availability` - Database availability changes
- `failover` - Failover events
- `failure` - Database failures
- `low-storage` - Storage space warnings

## Clean Up

```bash
terraform destroy
```

## Estimated Cost

- RDS db.t3.micro: ~$0.017/hour (~$12.50/month)
- Storage (20 GB): ~$2.30/month
- SNS: Free tier covers 1,000 email deliveries per month
- RDS Event Subscription: No charge

**Total: ~$15/month**

## Security Notes

- This example uses a hardcoded password for simplicity
- In production, use AWS Secrets Manager or SSM Parameter Store
- The database is not publicly accessible
- Security group restricts access to VPC CIDR only
