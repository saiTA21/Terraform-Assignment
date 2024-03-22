resource "aws_vpc" "main" {
  cidr_block       = lookup(var.vpc_cidr_block, terraform.workspace)
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = lookup(var.subnet_cidr_block_main, terraform.workspace)
  availability_zone = var.subnet_availability_zone_main
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "main2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = lookup(var.subnet_cidr_block_main2, terraform.workspace)
  availability_zone = var.subnet_availability_zone_main2
  tags = {
    Name = "Main-2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "example"
  }
}
