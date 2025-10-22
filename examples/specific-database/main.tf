provider "aws" {
  region = "us-east-1"
}

# Example RDS instance to monitor
resource "aws_db_instance" "example" {
  identifier             = "my-postgres-db"
  engine                 = "postgres"
  engine_version         = "16.1"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_encrypted      = true
  username               = "dbadmin"
  password               = "changeme123!" # In production, use AWS Secrets Manager
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.example.name
  vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name        = "example-db"
    Environment = "dev"
  }
}

# Example VPC resources (simplified)
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example_a" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "example-subnet-a"
  }
}

resource "aws_subnet" "example_b" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "example-subnet-b"
  }
}

resource "aws_db_subnet_group" "example" {
  name       = "example-db-subnet-group"
  subnet_ids = [aws_subnet.example_a.id, aws_subnet.example_b.id]

  tags = {
    Name = "example-db-subnet-group"
  }
}

resource "aws_security_group" "example" {
  name        = "example-db-sg"
  description = "Security group for example database"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "PostgreSQL access from VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "example-db-sg"
  }
}

# Monitor this specific RDS instance
module "db_event_subscription" {
  source = "git::https://github.com/hundredacres/terraform-aws-db-event-sub.git?ref=main"

  notification_email = "alerts@example.com"
  source_type        = "db-instance"
  source_ids         = [aws_db_instance.example.id]

  # Only monitor critical events
  event_categories = [
    "availability",
    "failover",
    "failure",
    "low-storage"
  ]
}
