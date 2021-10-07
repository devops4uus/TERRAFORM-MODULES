output "subnet_idd" {
  value = aws_subnet.this.id
}

output "vpcid" {
  value = aws_vpc.this.id
}
output "ami_id" {
  value = data.aws_ssm_parameter.this.value
}
