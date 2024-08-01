output "sg_id" {
    description = "security group for the ec2"
    value = aws_security_group.sg.id
  
}