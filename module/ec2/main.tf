resource "aws_instance" "default_instance" {
  count                              = var.instance_enabled == true ? var.instance_count : 0
  ami                                = var.ami
  instance_type                      = var.instance_type
  subnet_id                          = element(distinct(compact(concat(var.subnet_ids))), count.index)
  vpc_security_group_ids             = var.vpc_security_group_ids_list
  key_name                           = var.key_name
  associate_public_ip_address        = var.associate_public_ip_address
  user_data                          = var.user_data != "" ? base64encode(file(var.user_data)) : ""
  root_block_device {
    volume_size                      = var.disk_size
    delete_on_termination            = var.delete_on_termination
    encrypted                        = var.encrypted
    kms_key_id                       = var.kms_key_id
  }
  tags = merge (
  {
    Name =  format("%s%s%s", var.instance_name, "-", (count.index))
  }, var.additional_tags
  )
  


  volume_tags = merge (
  {
      "Name" =  format("%s%s%s", var.instance_volume_name, "-", (count.index))
    })
}  

resource "aws_eip" "default" {
  count = var.instance_enabled == true && var.assign_eip_address == true ? var.instance_count : 0

  network_interface = element(aws_instance.default_instance.*.primary_network_interface_id, count.index)
  vpc               = var.eip_vpc_enable

  tags = merge ({
      "Name" =  format("%s%s%s", var.eip_name, "-", (count.index))
    }, var.additional_tags
  )
}