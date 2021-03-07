variable "region" {
    default="eu-west-1"
}



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

variable "private_ingress_source_sg_list" {
  type    = list(map(string))
  description = "List of concatenated ports, protocols, CIDR (IPv4) blocks used for inbound rules"
  default = [
  {
    "description" = "For HTTP"
    "from_port" = "80"
    "to_port" = "80"
    "protocol" = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
  },
  {
    "description" = "For HTTPS"
    "from_port" = "443"
    "to_port" = "443"
    "protocol" = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
  },
  ]
}

variable "private_egress_source_sg_list" {
  type    = list(map(string))
  description = "List of concatenated ports, protocols, CIDR (IPv4) blocks used for outbound rules"
  default = [
  {
    "description" = "For All"
    "from_port" = "0"
    "to_port" = "0"
    "protocol" = "-1"
    "cidr_blocks" = "0.0.0.0/0"
  },]
}

variable "private_sg_name" {
  type = string
  description = "Name prefix for the security group"
  default = "private_subnet"
}

variable "private_sg_description" {
  type = string
  description = "Description of the security group"
  default = "private subnet group"
}

variable "private_instance_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the instance creation."
}

variable "private_instance_count" {
  type        = number
  default     = 1
  description = "Number of instances to launch."
}

variable "private_ami" {
  type        = string
  default = "ami-096f43ef67d75e998"
  description = "The AMI to use for the instance."
}

variable "private_instance_type" {
  type        = string
  default = "t2.micro"
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "private_key_name" {
  type        = string
  default = "terra_test"
  description = "The key name to use for the instance."
}

variable "private_associate_public_ip_address" {
  type        = bool
  default = false
  description = "Associate a public IP address with the instance."
}

variable "private_user_data" {
  type        = string
  default = ""
  description = "The Base64-encoded user data to provide when launching the instances."
}

variable "private_disk_size" {
  type        = number
  default = 11
  description = "Size of the root volume in gigabytes."
}

variable "private_delete_on_termination" {
  type        = bool
  default = true
  description = "Delete block device on terminate."
}

variable "private_volume_encrypted" {
  type        = bool
  default     = false
  description = "If true, the disk will be encrypted."
}

variable "private_volume_kms_key_id" {
  type        = string
  default = ""
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
}

variable "private_instance_name" {
  type        = string
  default = "test-instane"
  description = "Name of the instance for tagging."
}

variable "private_eip_name" {
  type        = string
  default = ""
  description = "Name of the eip for tagging."
}

variable "private_assign_eip_address" {
  type        = bool
  default = false
  description = "Assign an Elastic IP address to the instance."
}

variable "private_eip_vpc_enable" {
  type = bool
  default = true
  description = "Wheter to enable the eip in same subnet or not"
}

variable "private_instance_volume_name" {
  type        = string
  default = "private_ec2_volume"
  description = "Name of the instance volume for tagging."
}


variable "name" {
  description = "Set a name for the sns topic"
  type = string
  default = "test_topic"
}

variable "alarm_name" {
  description = "Set a name for alarm"
  type = string
  default = "terraform-test"
}

variable "comparison_operator" {
  description = "Set a value for threshold comparison"
  type = string
  default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  description = "Set a value for threshold comparison"
  type = number
  default = 2
}

variable "metric_name" {
  description = "Set a value for metric_name"
  type = string
  default = "CPUUtilization"
}

variable "namespace" {
  description = "Set a value for namespace"
  type = string
  default = "AWS/EC2"
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied"
  type = number
  default = 120
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric"
  type = string
  default = "Average"
}

variable "threshold" {
  description = "The value against which the specified statistic is compared"
  type = number
  default = 40
}

variable "insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state"
  type = list
  default = []
}

variable "alarm_description" {
  description = "The description for the alarm"
  type = string
  default = ""
}

variable "protocol" {
  description = "subscription protocol"
  type = string
  default = "email"
}

variable "endpoint" {
  description = "subscription endpoint"
  type = string
  default = "madhurigulve088@gmail.com"
}

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
