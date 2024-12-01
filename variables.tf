variable "Jenkins_ami_id" {
  description = "The AMI ID for the jenkins server "
  type =string

}
variable "application_ami_id" {
  description = "django-application servers ami id"
  type = string
}

variable "instance_type" {
  description = "instance type for ec2 servers"
  type = string
  default = "t2.micro"
}

