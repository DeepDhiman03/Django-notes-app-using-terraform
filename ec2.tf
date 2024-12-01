resource "aws_launch_template" "django_launch_template" {
  name_prefix   = "django-app-launch-template"
  image_id      = var.application_ami_id 
  instance_type = var.instance_type

  user_data = filebase64("./django-user-data.sh")


  network_interfaces {
    security_groups = [aws_security_group.instance_sg.id]
  }

  tags = {
    Name = "django-instance"
  }
}





# Create ALB (Application Load Balancer)
resource "aws_lb" "django_alb" {
  name               = "django-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id] # Two subnets across different AZs

  enable_deletion_protection = false
  idle_timeout              = 400
  tags = {
    Name = "django-alb"
  }
}

# Define target group for the ALB
resource "aws_lb_target_group" "django_target_group" {
  name     = "django-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Create listener for ALB
resource "aws_lb_listener" "django_listener" {
  load_balancer_arn = aws_lb.django_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.django_target_group.arn
  }
}

# Define security group for the ALB
resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "django-alb-sg"
  }
}

# Define security group for the EC2 instances
resource "aws_security_group" "instance_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "application"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "django-instance-sg"
  }
}

resource "aws_security_group" "jenkins_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-Security-Group"
  }
}

# Define the Auto Scaling Group
resource "aws_autoscaling_group" "django_asg" {
  desired_capacity     = 2
  min_size             = 1
  max_size             = 4
  vpc_zone_identifier  = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id] # Multiple subnets

  launch_template {
    id      = aws_launch_template.django_launch_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.django_target_group.arn]
}
