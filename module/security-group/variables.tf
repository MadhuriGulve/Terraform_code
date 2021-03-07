variable "ingress_rules" {
  type    = list(map(string))
  description = "List of concatenated ports, protocols, CIDR (IPv4) blocks used for inbound rules"
}

variable "egress_rules" {
  type    = list(map(string))
  description = "List of concatenated ports, protocols, CIDR (IPv4) blocks used for outbound rules"
}

variable "vpc_id" {
  type = string
  description = "The id of the VPC where the security group needs to be created"
}

variable "name_prefix" {
  type = string
  description = "Name prefix for the security group"
}

variable "description" {
  type = string
  description = "Description of the security group"
}

variable "additional_tags" {
  type    = map(string)
  description = "Additional tags to be added"
}