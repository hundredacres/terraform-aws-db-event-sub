# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial module implementation for AWS RDS event subscriptions
- SNS topic creation for event notifications
- Email subscription support
- Configurable source types (db-instance, db-parameter-group, db-security-group, db-snapshot)
- Configurable event categories with sensible defaults
- Support for filtering by specific source IDs
- Comprehensive variable validation:
  - Email format validation
  - Source type validation
  - Event category validation
- Terraform version constraints (>= 1.0)
- AWS provider constraints (>= 4.0)
- Pre-commit hooks configuration for:
  - Terraform formatting
  - Automated documentation updates
  - Terraform validation
  - TFLint checks
- Examples:
  - Basic usage example
  - Specific database monitoring example
- Documentation:
  - README with usage examples
  - Terraform-docs configuration
  - Output descriptions
  - Development setup guide

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

## [1.0.0] - TBD

Initial release

[Unreleased]: https://github.com/yourusername/terraform-aws-db-event-sub/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/yourusername/terraform-aws-db-event-sub/releases/tag/v1.0.0
