output "graphite_instance_id" {
  value = "${aws_instance.graphite_server.id}"
}

output "graphite_public_ip" {
  value = "${aws_instance.graphite_server.public_ip}"
}

output "graphite_ami_id" {
  value = "${aws_instance.graphite_server.ami}"
}

output "graphite_instance_type" {
  value = "${aws_instance.graphite_server.instance_type}"
}

output "graphite_vpc_security_group_ids" {
  value = "${aws_instance.graphite_server.vpc_security_group_ids}"
}

output "grafana_instance_id" {
  value = "${aws_instance.grafana_server.id}"
}

output "grafana_public_ip" {
  value = "${aws_instance.grafana_server.public_ip}"
}

output "grafana_ami_id" {
  value = "${aws_instance.grafana_server.ami}"
}

output "grafana_instance_type" {
  value = "${aws_instance.grafana_server.instance_type}"
}

output "grafana_vpc_security_group_ids" {
  value = "${aws_instance.grafana_server.vpc_security_group_ids}"
}
