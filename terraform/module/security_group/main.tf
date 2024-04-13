resource "aws_security_group" "nodeapp" {
  name        = "ec2_ecurity-group"
  description = "Allow inbound traffic on port 8080 and SSH"
  

  
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

