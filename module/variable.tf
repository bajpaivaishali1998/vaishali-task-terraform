# Creating VPC,name, CIDR and Tags........................................
variable "vpc_cidr" {
    type = string
  
}
variable "instance_tenancy" {
    type = string
  
}
variable "vpc_tag" {
    type = string
  
}

# Creating Public Subnets in VPC..................................
variable "public_subnet_cidr" {
    type = string
  
}
variable "true_val" {
  type = string

}
variable "public_availability_zone" {
    type = string
      
}
variable "public_subnet_tag" {
    type = string
  
}
# Creating Private Subnets in VPC..................................
variable "private_subnet_cidr" {
    type = string
  
}
variable "false_val" {
    type = string
  
}
variable "private_availability_zone" {
    type = string
  
}
variable "private_subnet_tag" {
    type = string
  
}
# Creating Internet Gateway in AWS VPC..................................
variable "internet_gateway_tag" {
    type = string
  
}
# Creating Route Tables for Internet gateway.......................................
variable "route_table_cidr" {
    type = string
  
}
variable "route_table_tag" {
    type = string
  
}
variable "key_name" {
  type = string
}

# Creating Route Associations public subnets...........................

################################################################

#instance variable...................................
variable "ami" {
    type = string
  
}
variable "instance_type" {
    type = string
  
}
variable "name" {
    type = string
  
}
variable "owner" {
    type = string
  
}

#### security group.............................................................
variable "security_group_name" {
  type = string
  
}
variable "security_group_tag" {
  type = string
  
}

variable "egress" {
  type = map(object({
    port = number
    protocol = string
    cidr_block = list(string)
  }))
}
  variable "ingress"{
    type = map(object({
      port = number
      protocol = string
      cidr_block = list(string)
      description = string
    }))
  }
  
  
