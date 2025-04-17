resource "aws_subnet" "aws_gogreen_public_subnets" {
  count=length(var.cidr_public_subnet)
  vpc_id =aws_vpc.vpc-gogreen_us-west-1.id
  cidr_block = element(var.cidr_public_subnet,count.index)
  availability_zone = element(var.us_availability_zone,count.index)

  tags={
    Name="Subnet-Public : Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "aws_gogreen_private_subnets_app" {
  count=length(var.cidr_private_app_subnet)
  vpc_id =aws_vpc.vpc-gogreen_us-west-1.id
  cidr_block = element(var.cidr_private_app_subnet,count.index)
  availability_zone = element(var.us_availability_zone,count.index)

  tags={
    Name="Subnet-Private : Private Subnets for App ${count.index + 1}"
  }
}

resource "aws_subnet" "aws_gogreen_private_subnets_rds" {
  count=length(var.cidr_private_rds_subnet)
  vpc_id =aws_vpc.vpc-gogreen_us-west-1.id
  cidr_block = element(var.cidr_private_rds_subnet,count.index)
  availability_zone = element(var.us_availability_zone,count.index)

  tags={
    Name="Subnet-Private : Private Subnets for RDS ${count.index + 1}"
  }
}