resource "aws_cloudtrail" "default_trail" {
  name                          = "${data.aws_iam_account_alias.current.account_alias}-aws"
  s3_bucket_name                = "${var.cloudtrail_bucket}"
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation = true
  event_selector {
    read_write_type           = "All"
    include_management_events = true

    #data_resource {
    #  type = "AWS::S3::Object"
    #  values = [
    #     "arn:aws:s3:::tf-bucket/foobar",
    #   ]
    #}
  }
}
