output "public-subnets" {
  value = module.VPC.public-subnets
}

output "private-subnets" {
  value = module.VPC.private-subnets
}


output "vpc_id" {
    value = module.VPC.vpc_id
}



output "vpc_cidr_block"{
    value = module.VPC.cidr_block
}

output "sg-terraform" {
    value = [aws_security_group.sg-terraform.id]
}


//output "public_ip_address" {
//    value = module.EC2.public_ip_address
//}
//
output "loadbalancer-dns-name" {
  value = module.EC2.loadbalancer-dns-name
}

output "rds-instance" {
  value = module.RDS.rds-instance
}


//+++++++++++++++++++DB OUTPUT++++++++++++++++++++++//

output "dbusername" {
  value = module.RDS.dbusername
}

output "dbpassword" {
  value = module.RDS.dbpassword
}

output "dbhost" {
  value = module.RDS.dbhost
}