variable "vpc_cidr" {
    description = "vpc_cidr range"
    type = string  
}

variable "subnet_cidr" {

    description = "subnets_cidr"
    type = list(string)
  
}

variable "subnet_name" {
    description = "subnets_name"
    type = list(string)
    default = [ "public_subnet1","public_subnet2" ]
  
}