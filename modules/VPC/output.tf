output "public-subnets" {
  value = [
      for subnet in aws_subnet.gokul_public_subnet : subnet.id
  ]
}

output "private-subnets" {
  value = [
      for subnet in aws_subnet.gokul_private_subnet : subnet.id
  ]
}

output "cidr_block" {
  value = aws_vpc.gokul_vpc_terraform.cidr_block
}

output "vpc_id" {
    value = aws_vpc.gokul_vpc_terraform.id
}

output "vpc_cidr_block" {
  value = [
      aws_vpc.gokul_vpc_terraform.cidr_block
    ]
}

