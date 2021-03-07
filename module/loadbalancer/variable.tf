variable "vpc_zone_identifier" {
  description = "Set to false to prevent the module from creating anything"
  type = list
}

variable "security_groups" {
  description = "Set to false to prevent the module from creating anything"
  type = list
}

variable "subnets" {
  description = "Set to false to prevent the module from creating anything"
  type = list
}

variable "vpc_id" {
  description = "Set to false to prevent the module from creating anything"
  type = string
}

