# key pair
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-inrfa-app-key"
  public_key = file("terra-key-ec2.pub")
  tags = {
    Environment= var.env

  }
}

# default vpc
resource "aws_default_vpc" "default_vpc" {}

# security group
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "security group for automation"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http open"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "flask app open"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

# ec2 instance
resource "aws_instance" "my_instance" {
  count = var.count_instance 
  ami                    = var.ec2_ami_id
  #user_data              = file("install_nginx.sh")
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-infra-app-instance"
    Environment=var.env
  }
}

