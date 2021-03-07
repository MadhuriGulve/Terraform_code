provider "aws" {
  region =  var.region
}

terraform {
  required_version = ">= 0.13.0"
}

locals {
  common_tags = {
    Purpose   = "test"
    Environment = "dev"
  }
  }
  
module "vpc" {
    source = "./module/vpc"
    vpc_enabled  = var.vpc_enabled
    enable_dns_hostnames = var.enable_dns_hostnames
    cidr_block = var.cidr_block
    cidr_block_public_subnet = var.cidr_block_public_subnet
    availability_zone_public_subnet = var.availability_zone_public_subnet
    cidr_block_private_subnet = var.cidr_block_private_subnet
    availability_zone_private_subnet = var.availability_zone_private_subnet
    igw_routes_for_public_subnets = var.igw_routes_for_public_subnets
    nat_routes_for_private_subnets = var.nat_routes_for_private_subnets
    map_public_ip_on_launch_public_subnet = var.map_public_ip_on_launch_public_subnet
    map_public_ip_on_launch_private_subnet = var.map_public_ip_on_launch_private_subnet
    nat_eip_vpc = var.nat_eip_vpc
    vpc_name = var.vpc_name
    public_subnet_name = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    igw_name = var.igw_name
    public_rt_name = var.public_rt_name
    natgw_name = var.natgw_name
    natgw_eip = var.natgw_eip
    private_rt_name = var.private_rt_name
    additional_tags = local.common_tags
    }
    
module "private_sg" {
  source = "./module/security-group"
  name_prefix = var.private_sg_name
  description = var.private_sg_description
  vpc_id = module.vpc.vpc_id
  additional_tags = local.common_tags
  ingress_rules = var.private_ingress_source_sg_list
  egress_rules = var.private_egress_source_sg_list
}

module "private_ec2" {
  depends_on = [module.private_sg, module.vpc]
  source = "./module/ec2"
  instance_enabled = var.private_instance_enabled
  additional_tags = local.common_tags
  instance_count = var.private_instance_count
  ami = var.private_ami
  instance_type = var.private_instance_type
  subnet_ids = [module.vpc.private_subnet_id]
  vpc_security_group_ids_list = [module.private_sg.id]
  key_name = var.private_key_name
  associate_public_ip_address = var.private_associate_public_ip_address
  user_data = var.private_user_data
  disk_size = var.private_disk_size
  delete_on_termination = var.private_delete_on_termination
  encrypted = var.private_volume_encrypted
  kms_key_id = var.private_volume_kms_key_id
  instance_name = var.private_instance_name
  assign_eip_address = var.private_assign_eip_address
  eip_name = var.private_eip_name
  eip_vpc_enable =var.private_eip_vpc_enable
  instance_volume_name = var.private_instance_volume_name 
}

module "alarm" {
	source = "./module/alarm"
	name                      = var.name
	#topic_arn                 = aws_sns_topic.test_topic.arn
  protocol                  = var.protocol
  endpoint                  = var.endpoint
	alarm_name                = var.alarm_name
  comparison_operator       = var.comparison_operator
	evaluation_periods        = var.evaluation_periods
	metric_name               = var.metric_name
	namespace                 = var.namespace
	period                    = var.period
	statistic                 = var.statistic
	threshold                 = var.threshold
	alarm_description         = var.alarm_description
  insufficient_data_actions = []
}

module "loadbalancer"{
	depends_on             = [module.private_sg, module.vpc]
	source                 = "./module/loadbalancer"
	source                 = "./module/loadbalancer"
	vpc_zone_identifier    = [module.vpc.public_subnet_id]
	security_groups        = module.private_sg
	subnets                = [module.vpc.private_subnet_id]
    vpc_id                 = module.vpc.vpc_id
}