variable "notification_email" {
  description = "Email address to subscribe to RDS event notifications."
  type        = string
}

variable "source_type" {
  description = "The type of source that will generate the events. Valid values: db-instance, db-parameter-group, db-security-group, db-snapshot."
  type        = string
  default     = "db-instance"
}

variable "source_ids" {
  description = "List of identifiers of the event sources for which events are returned. If omitted, events are returned for all sources of the specified source type."
  type        = list(string)
  default     = []
}

variable "event_categories" {
  description = "List of event categories for the event subscription."
  type        = list(string)
  default = [
    "availability",
    "backup",
    "configuration",
    "deletion",
    "failover",
    "low-storage",
    "maintenance",
    "notification",
    "read-replica",
    "recovery",
    "restoration"
  ]
}