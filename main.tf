module "creacion_vpc" {
    source = "./network"
    
    name_vpc = "davivienda VPC"
    cidr_block_vpc = "10.0.0.0/16"
      subnets = [
    {
      cidr_block        = "10.0.1.0/24"
      name              = "Private Subnet 1"
      availability_zone = "us-east-1a"
    },
    {
      cidr_block        = "10.0.2.0/24"
      name              = "Private Subnet 2"
      availability_zone = "us-east-1b"
    }
  ]

}