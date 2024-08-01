#VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

#2 Subnet in different availablity zone 
resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr)  
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name[count.index]
  }
}

# Internet Getway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-internet-gate"
  }
}

# Route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "my-rt"
  }

}

# Route Table Association
resource "aws_route_table_association" "rta" {
    count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
}