# Creating VPC,name, CIDR and Tags........................................
resource "aws_vpc" "main" {
cidr_block           = "${var.vpc_cidr}"
instance_tenancy     = "${var.instance_tenancy}"
    tags = {
    Name = "${var.vpc_tag}"
    }
}

# Creating Public Subnets in VPC..................................
resource "aws_subnet" "public" {
vpc_id                  = aws_vpc.main.id
cidr_block              = "${var.public_subnet_cidr}"
map_public_ip_on_launch = "${var.true_val}"
availability_zone       = "${var.public_availability_zone}"
    tags = {
    Name = "${var.public_subnet_tag}"
    }
}

# Creating Private Subnets in VPC..................................
resource "aws_subnet" "private" {
vpc_id                  = aws_vpc.main.id
cidr_block              = "${var.private_subnet_cidr}"
map_public_ip_on_launch = "${var.false_val}"
availability_zone       = "${var.private_availability_zone}"
    tags = {
    Name = "${var.private_subnet_tag}"
    }
}
# Creating Internet Gateway in AWS VPC..................................
resource "aws_internet_gateway" "internet-gw" {
vpc_id = aws_vpc.main.id
    tags = {
    Name = "${var.internet_gateway_tag}"
    }
}
# Creating Route Tables for Internet gateway.......................................
resource "aws_route_table" "public_route_table" {
vpc_id = aws_vpc.main.id
    route {
    cidr_block = "${var.route_table_cidr}"
    gateway_id = aws_internet_gateway.internet-gw.id
    }
        tags = {
        Name = "${var.route_table_tag}"
        }
}
# Creating Route Associations public subnets...........................
resource "aws_route_table_association" "route_table" {
subnet_id      = aws_subnet.public.id
route_table_id = aws_route_table.public_route_table.id
}

# Creating ec2 instance.......................................
resource "aws_instance" "instance" {
 # for_each = var.ami
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.public.id
  #security_groups = aws_security_group.sg.name
 
  tags = {
    Name = var.name
    Owner = var.owner
  }

}
#security group...............................................
resource "aws_security_group" "sg" {
    name = var.security_group_name
    description = "allow all inbound traffic"
    vpc_id = aws_vpc.main.id

   dynamic "ingress" {
            for_each = var.ingress
            content {
            from_port =ingress.value.port
            to_port =ingress.value.port
            protocol =ingress.value.protocol
            cidr_blocks = ingress.value.cidr_block       
            }
            
        }
    

    dynamic "egress" {
            for_each = var.egress
            content {
            from_port =egress.value.port
            to_port =egress.value.port
            protocol =egress.value.protocol
            cidr_blocks = egress.value.cidr_block          

            }                       
        }
        #ingress =  {
          #cidr_blocks = [aws_vpc.main.cidr_block]
          #description = "xyz"
          #from_port = 443
          #ipv6_cidr_blocks = [aws_vpc.main.cidr_block]
          #protocol = "tcp"
         # to_port = 443
       # } 
          #egress =  {
          #cidr_blocks = ["0.0.0.0/0"]
          #description = "xyz"
          #from_port = 0
          #ipv6_cidr_blocks = ["::/0"]
          #protocol = "-1"
          #to_port = 0
        #} 

    
    tags = {
      Name = "${var.security_group_tag}"
    }
  
}


