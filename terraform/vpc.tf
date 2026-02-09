data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security group for runners
resource "aws_security_group" "runner" {
  name_prefix = "${var.project_name}-runner-"
  description = "Security group for GitHub runners"
  vpc_id      = data.aws_vpc.default.id

  # Egress: Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  # No ingress rules

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project_name}-runner-sg"
  }
}