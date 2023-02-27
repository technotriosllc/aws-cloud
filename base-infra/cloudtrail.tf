resource "aws_cloudtrail" "management_events" {
  advanced_event_selector {
    field_selector {
      equals = ["Management"]
      field  = "eventCategory"
    }

    name = "Management events selector"
  }

  enable_log_file_validation    = "false"
  enable_logging                = "true"
  include_global_service_events = "true"
  is_multi_region_trail         = "true"
  is_organization_trail         = "false"
  name                          = "management-events"
  s3_bucket_name                = "aws-cloudtrail-logs-939375546786-9c522d80"
}
