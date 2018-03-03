provider "aws" {
  version = "~> 1.7.0"
  region  = "${var.region}"
  profile = "${var.profile}"
}
