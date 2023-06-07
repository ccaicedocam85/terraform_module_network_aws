variable "cidr_block_vpc" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "name_vpc" {
  description = "vpc name"
  type        = string
  default     = ""
}

variable "subnets_app" {
  type = list(object({
    cidr_block        = string
    name              = string
    availability_zone = string
  }))
}

variable "subnets_db" {
  type = list(object({
    cidr_block        = string
    name              = string
    availability_zone = string
  }))
}
