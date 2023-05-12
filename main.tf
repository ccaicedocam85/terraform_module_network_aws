module "creacion_vpc" {
    source = "./network"
    
    name_vpc = "davivienda VPC"
    cidr_block_vpc = "10.0.0.0/16"
    cidr_block_sub_net = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    
}