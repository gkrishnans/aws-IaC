module "VPC" {
  source = "./modules/vpc"
}

module "EC2" {
  source = "./modules/EC2"
}