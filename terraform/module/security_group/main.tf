resource "aws_security_group" "ec2_security_group" {
  name        = "ec2_ecurity-group"
  description = "Allow inbound traffic on port 8080 and SSH"
  id = "sg-0686955d7d3e3f545" 
  
  
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
output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_group.id
}

