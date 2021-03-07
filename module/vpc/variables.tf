

variable "vpc_enabled" {
  description = "Set to false to prevent the module from creating anything"
  type = bool
  default = true
}

variable "cidr_block" {
    type = string
    description = "CIDR for the VPC to create"
    default = "192.168.0.0/20"
}

variable "cidr_block_public_subnet" {
    type = list
    description = "CIDR for public subnet"
    default = ["192.168.2.0/24","192.168.3.0/24"]
}

variable "availability_zone_public_subnet" {
    type = string
    description = "AZ for public Subnet" 
    default = "eu-west-1b"
}

variable "cidr_block_private_subnet" {
    type = list
    description = "CIDR for private subnet"
    default = ["192.168.1.0/24","192.168.4.0/24"]
}

variable "availability_zone_private_subnet" {
    type = string
    description = "AZ for private subnet"
    default = "eu-west-1b"
}

variable "enable_dns_hostnames" {
    type = bool
    description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
    default = true
}

variable "nat_routes_for_private_subnets" {
  type    = string
  description = "Private Subnets - Destination CIDRs for routes passing through the NAT gateways"
  default = "0.0.0.0/0"
}

variable "igw_routes_for_public_subnets" {
  type    = string
  description = "Public Subnets - Destination CIDRs for routes passing through the Internet gateway"
  default = "0.0.0.0/0"
}

variable "vpc_name" {
  type    = string
  description = "VPC Name for name tagging"
  default = "vpc-test"
}

variable "public_subnet_name" {
  type    = string
  description = "Public Subnet Name for name tagging"
  default = "public-subnet"
}

variable "private_subnet_name" {
  type    = string
  description = "Private Subnet Name for name tagging"
  default = "private-subnet"
}

variable "igw_name" {
  type    = string
  description = "Internet gateway Name for name tagging"
  default = "test-igw"
}

variable "public_rt_name" {
  type    = string
  description = "public route table Name for name tagging"
  default = "public-rt"
}

variable "natgw_name" {
  type    = string
  description = "Natgateway Name for name tagging"
  default = "natgw"
}

variable "private_rt_name" {
  type    = string
  description = "private route table Name for name tagging"
  default = "private-rt"
}

variable "natgw_eip" {
  type    = string
  description = "Natgateway eip Name for name tagging"
  default = "natgw-eip"
}

variable "map_public_ip_on_launch_public_subnet" {
    type = bool
    description = "A boolean flag to enable/disable public ip map in public subnet. Defaults true."
    default = true
}

variable "map_public_ip_on_launch_private_subnet" {
    type = bool
    description = "A boolean flag to enable/disable public ip map in private subnet. Defaults false."
    default = false
}

variable "nat_eip_vpc" {
    type = bool
    description = "A boolean flag to enable/disable elastic ip for nat gw in same vpc. Defaults true."
    default = true
}

variable "additional_tags" {
  type    = map(string)
  description = "Additional tags to be added"
  # default = {
  #       Purpose   = "test"
  #       Environment = "dev"
  # }
}