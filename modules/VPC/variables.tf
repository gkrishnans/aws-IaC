
variable "subnets_cidr_public" {
	type = list
	default = ["108.0.3.0/24", "108.0.4.0/24"]
}

variable "azs_public" {
	type = list
	default = ["us-east-1c", "us-east-1d"]
}


variable "subnets_cidr_private" {
	type = list
	default = ["108.0.1.0/24", "108.0.2.0/24"]
}


variable "azs_private" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}


variable "vpc_cidr" {
  type = string
  default = "108.0.0.0/16"
}