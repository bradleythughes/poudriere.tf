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

locals {
  # filename for the public ssh key comes from the key name
  public_key_filename = "${var.public_key_name}.pub"
}

resource aws_key_pair ssh-key {
  key_name = "${var.public_key_name}"
  public_key = "${file(local.public_key_filename)}"
}
