output "subnet_id_main" {
  value = aws_subnet.main.id
}

output "subnet_id_main2" {
  value = aws_subnet.main2.id
}
output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "subnet_cidr_block_main" {
  value = var.subnet_cidr_block_main
}

output "subnet_cidr_block_main2" {
  value = var.subnet_cidr_block_main2
}
output "subnet_availability_zone_main2" {
  value = var.subnet_availability_zone_main2
}

output "subnet_availability_zone_main" {
  value = var.subnet_availability_zone_main
}


