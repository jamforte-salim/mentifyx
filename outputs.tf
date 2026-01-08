output "instance_public_ip" {
  value = aws_instance.test_vm.public_ip
}