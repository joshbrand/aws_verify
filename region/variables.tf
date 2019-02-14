variable "region" {}
variable "config-role-arn" {}
variable "account" {}

variable "config-bucket" {
  default = "chef-central-config"
}

variable "config-global" {
  default = "false"
}
