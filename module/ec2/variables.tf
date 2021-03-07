variable "instance_enabled" {
  type        = bool
  description = "Flag to control the instance creation."
}

variable "instance_count" {
  type        = number
  description = "Number of instances to launch."
}

variable "ami" {
  type        = string
  description = "The AMI to use for the instance."
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of VPC Subnet IDs to launch in."
}

variable "vpc_security_group_ids_list" {
  type        = list(string)
  description = "A list of security group IDs to associate with."
}

variable "key_name" {
  type        = string
  description = "The key name to use for the instance."
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the instance."
}

variable "user_data" {
  type        = string
  description = "The Base64-encoded user data to provide when launching the instances."
}

variable "disk_size" {
  type        = number
  description = "Size of the root volume in gigabytes."
}

variable "delete_on_termination" {
  type        = bool
  description = "Delete block device on terminate."
}

variable "encrypted" {
  type        = bool
  description = "If true, the disk will be encrypted."
}

variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
}

variable "instance_volume_name" {
  type        = string
  description = "Name of the instance volume for tagging."
}

variable "instance_name" {
  type        = string
  description = "Name of the instance for tagging."
}

variable "eip_name" {
  type        = string
  description = "Name of the eip for tagging."
}

variable "assign_eip_address" {
  type        = bool
  description = "Assign an Elastic IP address to the instance."
}

variable "eip_vpc_enable" {
  type = bool
  description = "Wheter to enable the eip in same subnet or not"
}


variable "additional_tags" {
  type    = map(string)
  description = "Additional tags to be added"
}