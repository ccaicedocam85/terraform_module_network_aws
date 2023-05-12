module "creacion_vpc" {
  source = "./modulos/network"

  name_vpc       = "davivienda VPC"
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

module "creacion_security_group" {
  source              = "./modulos/security_groups"
  name_security_group = "Sg 1"
  vpc_id              = "vpc-0d5604c5561d99918"
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
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS access"
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
    },
    {
      from_port       = 0
      to_port         = 65535
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = ["sg-00c1207554b9002c5"]
      description     = "Allow all outbound traffic"
    }

  ]

}
