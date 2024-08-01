resource "aws_instance" "ec2_instance1" {
count = length(var.ec2_names)
  ami                    = "ami-0ad21ae1d0696ad58"  
  instance_type          = "t2.micro"
  key_name               = "mumbai-key"  
  subnet_id              = var.subnets[count.index]
  vpc_security_group_ids = [var.sg_id]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  associate_public_ip_address = true

  tags = {
    Name = var.ec2_names[count.index]
  }
}