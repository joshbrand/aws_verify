variable "regions" {
  default = [
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2",
    "ca-central-1",
    "eu-central-1",
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-southeast-1",
    "ap-southeast-2",
    "ap-south-1",
    "sa-east-1",
  ]
}

module "base" {
  source = "base"
  region = "us-east-1"
}

module "region-us-east-1" {
  source          = "region"
  region          = "us-east-1"
  config-global   = true
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-us-east-2" {
  source          = "region"
  region          = "us-east-2"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-us-west-1" {
  source          = "region"
  region          = "us-west-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-us-west-2" {
  source          = "region"
  region          = "us-west-2"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-ca-central-1" {
  source          = "region"
  region          = "ca-central-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-eu-central-1" {
  source          = "region"
  region          = "eu-central-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-eu-west-1" {
  source          = "region"
  region          = "eu-west-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-eu-west-2" {
  source          = "region"
  region          = "eu-west-2"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-eu-west-3" {
  source          = "region"
  region          = "eu-west-3"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-ap-northeast-1" {
  source          = "region"
  region          = "ap-northeast-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-ap-northeast-2" {
  source          = "region"
  region          = "ap-northeast-2"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-ap-southeast-1" {
  source          = "region"
  region          = "ap-southeast-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-ap-southeast-2" {
  source          = "region"
  region          = "ap-southeast-2"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-ap-south-1" {
  source          = "region"
  region          = "ap-south-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

module "region-sa-east-1" {
  source          = "region"
  region          = "sa-east-1"
  account         = "${data.aws_iam_account_alias.current.account_alias}"
  config-role-arn = "${module.base.config-role-arn}"
}

data "aws_iam_account_alias" "current" {}

output "account_id" {
  value = "${data.aws_iam_account_alias.current.account_alias}"
}
