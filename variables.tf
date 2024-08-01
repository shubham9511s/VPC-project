variable "vpc_cidr" {
  description = "vpc_cidr range"
  type        = string
}

variable "subnet_cidr" {

  description = "subnets"
  type        = list(string)

}