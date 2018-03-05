provider "aws" {
  version = "~> 1.7.0"
  region  = "${var.region}"
  profile = "${var.profile}"
}

resource aws_ebs_volume zfs-volume {
  availability_zone = "${var.availability-zone}"
  size = 100
  type = "gp2"
}
