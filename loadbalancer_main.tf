provider "aws" {
region = "us-east-1"
}

terraform {
required_version = ">= 0.13.0"
}

resource "aws_autoscaling_group" "asg_test" {
name = "test-asg"
launch_configuration = aws_launch_configuration.launch_config.name
desired_capacity = "1"
min_size = "1"
max_size = "1"
# load_balancers = var.alb
vpc_zone_identifier = ["subnet-public", "subnet-private"]
health_check_type = "EC2"
health_check_grace_period = "300"
}

resource "aws_launch_configuration" "launch_config" {
name_prefix = "test-conf"
image_id = "ami-0915bcb5fa77e4892"
instance_type = "t2.micro"
key_name = "amazonlinux"
user_data = "./scripts/apache-install.tpl"
associate_public_ip_address = "false"
security_groups = ["sg-private"]

ebs_block_device {
device_name = "/dev/xvdz"
volume_type = "gp2"
volume_size = "8"
}

root_block_device {
volume_size = "8"
volume_type = "gp2"
}

}

resource "aws_lb" "alb"{
name = "test-alb"
subnets = ["subnet-public", "subnet-private"]
security_groups = ["sg-public"]
load_balancer_type = "application"
internal = "false"
idle_timeout = "60"
}

resource "aws_lb_listener" "alb_listener"{
load_balancer_arn = aws_lb.alb.arn
port = "80"
protocol = "HTTP"

default_action {
target_group_arn = aws_lb_target_group.alb_target_group.arn
type = "forward"
}
}

resource "aws_lb_target_group" "alb_target_group"{
name = "test-alb-tg"
port = "80"
protocol = "HTTP"
target_type = "instance"
vpc_id = "vpc-ID"

# stickiness = {
# enabled = "false"
# }
health_check {
healthy_threshold = "5"
unhealthy_threshold = "3"
timeout = "2"
interval = "30"
path = "/"
port = "80"
matcher = "200"
}

}