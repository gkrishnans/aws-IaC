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
  vpc_id          = module.VPC.vpc_id
  private-subnets = module.VPC.private-subnets
}

