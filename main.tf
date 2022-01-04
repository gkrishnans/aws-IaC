module "VPC" {
  source = "./modules/VPC"
}

module "RDS" {
  source = "./modules/RDS"
  vpc_id          = module.VPC.vpc_id
  private-subnets = module.VPC.private-subnets
}

module "EC2" {
  source = "./modules/EC2"
  vpc_cidr_block  = module.VPC.cidr_block
  public-subnets  = module.VPC.public-subnets
  private-subnets = module.VPC.private-subnets
  vpc_id          = module.VPC.vpc_id
  sg-terraform    = [aws_security_group.gokul-sg-terraform.id]
  dbusername = module.RDS.dbusername
  dbpassword = module.RDS.dbpassword
  dbhost = module.RDS.dbhost
}



//  provisioner "local-exec" {
//    command = "echo endpoint of rds is ${self.endpoint} > /home/sgk/Desktop/projects/gokul-terraform/aws-IaC/output.txt"
//  }
  



//resource "null_resource" "peering-provision" {
//  depends_on = [module.RDS.aws_db_instance]
//
//  provisioner "local-exec" {    
//      command = <<EOT
//                      "echo endpoint of rds is ${module.RDS.rds-instance} > output.txt"
//                      "export endpoint=${module.RDS.rds-instance}" 
//                  EOT
//    }
//}



