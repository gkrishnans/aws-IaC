module "VPC" {
  source = "./modules/VPC"
}



module "EC2" {
  source = "./modules/EC2"
  vpc_cidr_block  = module.VPC.cidr_block
  public-subnets  = module.VPC.public-subnets
  private-subnets = module.VPC.private-subnets
  vpc_id          = module.VPC.vpc_id
  sg-terraform    = [aws_security_group.gokul-sg-terraform.id]
}

module "RDS" {
  source = "./modules/RDS"
  security_groups = [aws_security_group.sgkMySQL-SG.id]
  vpc_security_group_ids = [aws_security_group.gokul_aws_rds_sg_terraform.id]
  private-subnets = module.VPC.private-subnets
}
