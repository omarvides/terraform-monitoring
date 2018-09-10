variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "instance_type" {
  type    = "string"
  default = "t2.micro"
}

variable "graphite_server_ami" {
  type    = "string"
  default = "ami-09a613cf6c00f6d02"
}

variable "name" {
  type    = "string"
  default = "graphite_server"
}

variable "grafana_server_ami" {
  type    = "string"
  default = "ami-084b21e5b621bc2cf"
}

variable "grafana_server_name" {
  type    = "string"
  default = "Grafana"
}

variable "graphite_server_name" {
  type    = "string"
  default = "Graphite"
}

variable "public_key" {
  type = "string"
}
