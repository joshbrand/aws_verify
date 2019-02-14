variable "region" {}

variable "cloudtrail_bucket" {
  default = "chef-central-cloudtrail"
}

variable "alias" {
  default = "default"
}
