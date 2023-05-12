variable "cidr_block_ip4" {
    description = "The IPv4 CIDR block for the VPC."
    type = string
}

variable "name" {
    description = "vpc name"
    default = ""
}