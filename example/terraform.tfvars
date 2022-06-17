## instance and vpc............................................................

ami="ami-07620139298af599e" 
instance_type = "t2.micro"
name = "vaishali_ec2_first"
owner = "bajpaivaishali1998@gmail.com"
key_name = "vaishalikey"
        

    #"ami-0cf0f96c6ca5f5353" ={
     #   instance_type = "t2.micro"
      #  name = "vaishali_ec2_second"
       # owner = "bajpaivaishali1998@gmail.com"
    #}
#vpc_id = "123456"

vpc_cidr = "10.0.0.0/16"

instance_tenancy = "default"

public_subnet_cidr = "10.0.1.0/24"

private_subnet_cidr = "10.0.3.0/24"

route_table_cidr = "0.0.0.0/0"

public_availability_zone = "ap-southeast-2a"

private_availability_zone = "ap-southeast-2b"

vpc_tag = "vaishalivpc"

public_subnet_tag = "vaishali_public_subnet"

private_subnet_tag = "vaishali_private_subnet"

internet_gateway_tag = "vaishali_ING"

route_table_tag = "vaishali_RT"


true_val = true

false_val = false

## security group and dynamic block..................................................

security_group_tag = "vaishali security group tag"

ingress = {
    "80"={
        cidr_block=["0.0.0.0/0"]
        port=80
        protocol="tcp"
        description="http port"
    }
    "443"={
        cidr_block=["0.0.0.0/0"]
        port=443
        protocol="tcp"
        description="https"
    }
}
egress = {
    "80"={
        cidr_block=["0.0.0.0/0"]
        port=80
        protocol="tcp"
        description="http port"
    }
    "443"={
        cidr_block=["0.0.0.0/0"]
        port=443
        protocol="tcp"
        description="https"
    }
}







security_group_name = "my_security_group"



