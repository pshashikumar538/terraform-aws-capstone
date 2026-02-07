resource "aws_launch_template" "this" {
  name_prefix   = "lt-${var.environment}-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.security_group_id]

 user_data = base64encode(<<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd

  PRIVATE_IP=$(hostname -I | awk '{print $1}')

  cat <<HTML > /var/www/html/index.html
  <h1>Hello from ${var.environment}</h1>
  <p>Private IP: $${PRIVATE_IP}</p>
  HTML
EOF
)


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "asg-ec2-${var.environment}"
      Environment = var.environment
    }
  }
}

resource "aws_autoscaling_group" "this" {
  name                = "asg-${var.environment}"
  desired_capacity    = 2
  min_size            = 1
  max_size            = 3
  vpc_zone_identifier = var.subnet_ids
  target_group_arns   = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 120

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}
