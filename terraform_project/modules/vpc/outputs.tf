
output "vpcid" {
  value = aws_vpc.vpc.id
}

output "vpccidr" {
  value = aws_vpc.vpc.cidr_block
}

##public-subnet##
output "publicsubnet01" {
  value = aws_subnet.subnet-01.id
}
output "publicsubnet02" {
  value = aws_subnet.subnet-02.id
}

##Private-subnet##
output "privatesubnet01" {
  value = aws_subnet.private-subnet-01.id
}

##security Group##
output "ssh" {
  value = aws_security_group.test.id
}
output "elb-sg" {
  value = aws_security_group.elb-sg.id
}


