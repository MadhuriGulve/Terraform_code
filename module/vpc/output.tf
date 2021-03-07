output "vpc_id" {
    value = aws_vpc.main[0].id
    description = "Created vpc id"
}

output "default_nacl_id" {
    value = aws_vpc.main[0].default_network_acl_id
}

output "public_subnet_id" {
    value = aws_subnet.public-subnet.id
    description = "Public Subnet id"
}

output "private_subnet_id" {
    value = aws_subnet.private-subnet.id
    description = "Private Subnet id"
}