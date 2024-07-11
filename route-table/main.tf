 //Create route-table public 
resource "aws_route_table" "public-RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id                       
  }

  tags = {
    Name = "pub-RT"
  }
}


data "aws_subnet" "public" {
  for_each = toset(var.public_subnets)

 filter {
    name   = "cidrBlock"
    values = [each.value]
  }
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name   = "availabilityZone"
    values = [var.availability_zones[each.key]]
  }
}

#Create route-table-association public
resource "aws_route_table_association" "public-sn" {
    for_each = data.aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public-RT.id
}