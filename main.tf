module "creacion_vpc" {
    source = "./network"
    
    name = "davivienda VPC"
    cidr_block_ip4 = "10.0.0.0/16"
  
}