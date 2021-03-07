

resource "aws_vpc" "main" {
  count = var.vpc_enabled ? 1 : 0
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge({
    Name = var.vpc_name
  }, var.additional_tags )
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.main[0].id
  cidr_block              = var.cidr_block_public_subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch_public_subnet
  availability_zone       = var.availability_zone_public_subnet

  tags = merge({
    Name = var.public_subnet_name
  }, var.additional_tags )
}

resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.main[0].id
  cidr_block              = var.cidr_block_private_subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch_private_subnet
  availability_zone       = var.availability_zone_private_subnet

  tags = merge({
    Name = var.private_subnet_name
  }, var.additional_tags )
}

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main[0].id

  tags = merge({
    Name = var.igw_name
  }, var.additional_tags )
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main[0].id
  route {
    cidr_block = var.igw_routes_for_public_subnets
    gateway_id = aws_internet_gateway.internet-gw.id
  }
    tags = merge({
      Name = var.public_rt_name
  }, var.additional_tags )
}

resource "aws_route_table_association" "public-rta" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}


resource "aws_eip" "nat" {
  vpc = var.nat_eip_vpc
  tags = merge({
    Name = var.natgw_eip
  }, var.additional_tags )
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnet.id
  depends_on    = [aws_internet_gateway.internet-gw]
  tags = merge({
    Name = var.natgw_name
  }, var.additional_tags )
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main[0].id
  route {
    cidr_block     = var.nat_routes_for_private_subnets
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = merge({
      Name = var.private_rt_name
  }, var.additional_tags )
}

resource "aws_route_table_association" "private-rta" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-rt.id
}
