output "public_ip" {
  value = "${aws_instance.main[0].public_ip}"
}
