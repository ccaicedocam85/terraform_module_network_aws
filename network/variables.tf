variable "cidr_block_vpc" {
    description = "The IPv4 CIDR block for the VPC."
    type = string
}

variable "name_vpc" {
    description = "vpc name"
    type = string
    default = ""
}

variable "cidr_block_sub_net" {
    description = "The IPv4 CIDR block for the subnet"
    type = string
}

variable "availability_zone" {
  description = "AZ for the subnet."
  type = string
}