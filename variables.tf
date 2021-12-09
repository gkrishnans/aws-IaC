variable "subnets_cidr_private" {
	type = list
	default = ["108.0.1.0/24", "108.0.2.0/24"]
}

variable "subnets_cidr_public" {
	type = list
	default = ["108.0.3.0/24", "108.0.4.0/24"]
}


variable "azs_private" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}

variable "azs_public" {
	type = list
	default = ["us-east-1c", "us-east-1d"]
}




variable "instance_ami" {
  default = "ami-0ed9277fb7eb570c9"
}


variable "instance_tags" {
  type = list
  default = ["Terraform-1", "Terraform-2"]
}




variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "instance_key" {
  default = "gk-presidioKey"
}