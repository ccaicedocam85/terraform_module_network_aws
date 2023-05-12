variable "cidr_block_vpc" {
    description = "The IPv4 CIDR block for the VPC."
    type = string
}

variable "name_vpc" {
    description = "vpc name"
    default = ""
}

variable "cidr_block_sub_net" {
    description = "vpc name"
    default = "The IPv4 CIDR block for the subnet"
}