resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from ${var.environment}</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "ec2-${var.environment}"
    Environment = var.environment
  }
}
