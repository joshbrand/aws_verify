resource "aws_config_configuration_recorder_status" "config-status" {
  name       = "${aws_config_configuration_recorder.config-recorder.name}"
  is_enabled = true
  depends_on = ["aws_config_delivery_channel.config-channel"]
}

resource "aws_config_delivery_channel" "config-channel" {
  name           = "${var.account}-config"
  s3_bucket_name = "${var.config-bucket}"
  depends_on     = ["aws_config_configuration_recorder.config-recorder"]
}

resource "aws_config_configuration_recorder" "config-recorder" {
  name = "${var.account}-config"

  recording_group {
    include_global_resource_types = "${var.config-global}"
  }

  role_arn = "${var.config-role-arn}"
}
