# Basic Example

This example demonstrates the most basic usage of the module, monitoring all RDS instances with default event categories.

## Usage

To run this example:

```bash
terraform init
terraform plan
terraform apply
```

After applying, you will receive a confirmation email at the specified address. You must confirm the subscription to start receiving notifications.

## What This Creates

- SNS topic for RDS events
- RDS event subscription monitoring all db-instances with default event categories
- Email subscription to the SNS topic

## Clean Up

```bash
terraform destroy
```

## Estimated Cost

- SNS: Free tier covers 1,000 email deliveries per month
- RDS Event Subscription: No charge
