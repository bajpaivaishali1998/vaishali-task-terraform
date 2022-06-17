#module "myvpc"{
 #   source = "../module/vpc"
  #  for_each = var.vpcs
   # mycidr = each.key
   # mytags = each.value.tags
#}
##vpc............................................................
module "myvpc" {  
    source = "../"
    #vpc_id = var.vpc_id
    vpc_cidr = var.vpc_cidr
    instance_tenancy = var.instance_tenancy
    vpc_tag = var.vpc_tag
##public subnet.................................................
    public_subnet_cidr= var.public_subnet_cidr
    true_val = var.true_val
    public_availability_zone       = var.public_availability_zone
    public_subnet_tag = var.public_subnet_tag
##privet subnet.................................................
    private_subnet_cidr              = var.private_subnet_cidr
    private_availability_zone       = var.private_availability_zone
    private_subnet_tag = var.private_subnet_tag
    false_val = var.false_val

##internet gateway.............................................
    internet_gateway_tag = var.internet_gateway_tag


# Creating Route Tables for Internet gateway.......................................
    route_table_tag = var.route_table_tag
    route_table_cidr = var.route_table_cidr


# Creating Route Associations public subnets...........................


# Creating ec2 instance.......................................
   ami = var.ami
   instance_type = var.instance_type
   key_name=var.key_name
   name = var.name
   owner=var.owner


#security group...............................................
    security_group_name = var.security_group_name
    security_group_tag = var.security_group_tag


##dynamicblock.........................................
ingress=var.ingress
egress=var.egress

}

