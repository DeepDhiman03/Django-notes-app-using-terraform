output "jenkins_instance_ip_adress" {
  value = aws_instance.jenkins_instance.public_ip
}
