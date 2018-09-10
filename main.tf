provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "access_key" {
  key_name   = "access"
  public_key = "${var.public_key}"
}

resource "aws_instance" "graphite_server" {
  ami           = "${var.graphite_server_ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${var.graphite_server_name}"
  }

  security_groups = [
    "${aws_security_group.graphite_http_inbound.name}",
    "${aws_security_group.ssh_access.name}",
    "${aws_security_group.graphite_metrics_inbound.name}",
  ]

  key_name = "${aws_key_pair.access_key.key_name}"
}

resource "aws_instance" "grafana_server" {
  ami           = "${var.grafana_server_ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${var.grafana_server_name}"
  }

  security_groups = [
    "${aws_security_group.grafana_inbound.name}",
    "${aws_security_group.ssh_access.name}",
  ]

  key_name = "${aws_key_pair.access_key.key_name}"
}

resource "aws_security_group" "ssh_access" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "graphite_http_inbound" {
  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "graphite_metrics_inbound" {
  ingress {
    from_port   = 8125
    to_port     = 8125
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "grafana_inbound" {
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
