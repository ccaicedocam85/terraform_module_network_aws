/*
terraform {

  cloud {
    organization = "ccaicedocam"

    workspaces {
      name = "terraform_module_network_aws"
    }
  }
}
*/

provider "aws" {
    region  = "us-east-1"
}

module "creacion_vpc" {
  source = "./modulos/network"

  name_vpc       = var.name_vpc
  cidr_block_vpc = "10.0.0.0/16"
  subnets_app = [
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
  subnets_db = [
    {
      cidr_block        = "10.0.3.0/24"
      name              = "Private Subnet 3"
      availability_zone = "us-east-1a"
    },
    {
      cidr_block        = "10.0.4.0/24"
      name              = "Private Subnet 4"
      availability_zone = "us-east-1b"
    }
  ]
}

module "creacion_security_group" {
  source              = "./modulos/security_groups"
  name_security_group = "Sg 1"
  vpc_id              = module.creacion_vpc.vpc_id
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH access"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP access"
    }
  ]

  egress_rules = [
    {
      from_port       = 0
      to_port         = 65535
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
      description     = "Allow all outbound traffic"
    }
  ]
}
