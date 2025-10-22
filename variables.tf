variable "notification_email" {
  description = "Email address to subscribe to RDS event notifications."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.notification_email))
    error_message = "The notification_email must be a valid email address."
  }
}

variable "source_type" {
  description = "The type of source that will generate the events. Valid values: db-instance, db-parameter-group, db-security-group, db-snapshot."
  type        = string
  default     = "db-instance"

  validation {
    condition     = contains(["db-instance", "db-parameter-group", "db-security-group", "db-snapshot"], var.source_type)
    error_message = "The source_type must be one of: db-instance, db-parameter-group, db-security-group, db-snapshot."
  }
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

  validation {
    condition = alltrue([
      for category in var.event_categories :
      contains([
        "availability",
        "backup",
        "configuration change",
        "configuration",
        "creation",
        "deletion",
        "failover",
        "failure",
        "low storage",
        "low-storage",
        "maintenance",
        "notification",
        "read replica",
        "read-replica",
        "recovery",
        "restoration"
      ], category)
    ])
    error_message = "Invalid event category. Valid categories include: availability, backup, configuration, creation, deletion, failover, failure, low-storage, maintenance, notification, read-replica, recovery, restoration."
  }

  validation {
    condition     = length(var.event_categories) > 0
    error_message = "At least one event category must be specified."
  }
}