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


output "vpc_id" {
    value = aws_vpc.gokul_vpc_terraform.id
}
