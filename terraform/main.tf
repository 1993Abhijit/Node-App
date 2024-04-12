
provider "aws" {
  region = "us-east-2" # Reemplaza con tu región preferida
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-00cda30cf72311684" # AMI de Amazon Linux 2 (Consulta la lista de AMI actualizada)
  instance_type = "t2.micro" 
  key_name = module.ssh_key.ec2_key.key_name
  security_groups = [module.security_group.security_group_id]             # Tipo de instancia en la capa gratuita

  tags = {
    Name = "Nodeapp"
  }
}



module "security_group" {
  source = "./module/security_group"
}
module "ssh_key" {
  source = "./module/ssh_key"

  
}

