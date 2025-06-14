resource "aws_subnet" "private" {
  count = length(var.private_subnets.cidr_block)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets.cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(local.private_subnets_tags, {
    Name             = "${var.env}-private-subnet-${count.index}",
    AvailabilityZone = var.availability_zones[count.index]
  })
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets.cidr_block)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnets.cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = merge(local.public_subnets_tags, {
    Name             = "${var.env}-public-subnet-${count.index}",
    AvailabilityZone = var.availability_zones[count.index]
  })
}
