resource "aws_eip" "nat_eip" {
  count=length(var.cidr_private_app_subnet)
  vpc= true
}
resource "aws_nat_gateway" "nat_gateway" {
  count=length(var.cidr_private_app_subnet)
  depends_on = [ aws_eip.nat_eip ]
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id = aws_subnet.aws_gogreen_private_subnets_app[count.index].id

  tags={
    "Name" = "Private NAT GW: For GoGreen US West Project"
  }
}