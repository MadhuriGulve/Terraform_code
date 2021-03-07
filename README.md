
# Terraform-

**MODULE WRITEN:**

- VPC
      -Public and private subnets
      -Public and private route tables
      -Elastic IPs
      -Network Interfaces
      -NAT Gateways
      -An Internet Gateway
      -EC2 Instance in private subnet
      -A VPC Endpoint
- EC2
      -EC2 Instance in private subnet
      
- Security Group
      -Configuring security rules

- Loadbalancer 
      -ALB
      -Listener rules
      -Target groups
      -autocaling group

- Alarm 
      -SNS
      -Subscription 
      -alarm creation
      
**TERRAFORM VERSIONS:**

Terraform 0.13 or less then 0.12
  
**USAGE:**

- VPC:  

```
resource "aws_vpc" "main" {
  count = var.vpc_enabled ? 1 : 0
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge({
    Name = var.vpc_name
  }, var.additional_tags )
}
```

- Security Group

```
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
```

Before running this code you need to create your key file and need to give suitable AMI ID in main code file.
Frist run the main code and then for loadbalancer you change subnets and security groups that are provisioned from main code.
In loadbalancer as mention need to give public subnet and for Instance which is created from autoscaling group you need to give private subnet.
And then run loadbalancer code for completing infra.

For autoscaling you need to have 2 public and 2 private or multi AZ.



