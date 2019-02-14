provider "aws" {
  region = "${var.region}"
}

data "aws_iam_account_alias" "current" {}

resource "aws_s3_bucket" "config-bucket" {
  bucket        = "${data.aws_iam_account_alias.current.account_alias}-config"
  force_destroy = true
}

resource "aws_iam_role" "config-role" {
  name = "${data.aws_iam_account_alias.current.account_alias}-config-role"
  path = "/service-role/"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "config-policy" {
  name = "${data.aws_iam_account_alias.current.account_alias}-config-policy"
  role = "${aws_iam_role.config-role.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject*"
            ],
            "Resource": [
              "${aws_s3_bucket.config-bucket.arn}",
              "${aws_s3_bucket.config-bucket.arn}/*"   
            ],
            "Condition": {
                "StringLike": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketAcl"
            ],
            "Resource": "arn:aws:s3:::${aws_s3_bucket.config-bucket.bucket}"
        }
    ]
}POLICY
}

output "config-bucket" {
  value = "${aws_s3_bucket.config-bucket.bucket}"
}

output "config-role-arn" {
  value = "${aws_iam_role.config-role.arn}"
}