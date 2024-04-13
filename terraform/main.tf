
provider "aws" {
  region = "us-east-2" 
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-00cda30cf72311684" 
  instance_type = "t2.micro" 
  key_name = "ec2_key"
  vpc_security_group_ids = [aws_security_group.nodeapp.id]
     

  tags = {
    Name = "Nodeapp"
  }
}

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



