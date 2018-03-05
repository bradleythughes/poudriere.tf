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

data aws_vpc default {
  default = true
}

resource aws_security_group poudriere {
  name = "poudriere"
  description = "Allow SSH/HTTP from the internet"
  vpc_id = "${data.aws_vpc.default.id}"

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    ipv6_cidr_blocks = ["::/0"]
  }
}
