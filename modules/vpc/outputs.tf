output "subnet_id" {
  value = "${aws_subnet.main}"
}

output "security_group_id" {
  value = "${aws_security_group.allow_ssh.id}"
}
