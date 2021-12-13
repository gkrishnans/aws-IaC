

variable "instance_ami" {
  default = "ami-0ed9277fb7eb570c9"
}

variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_key" {
  default = "gk-presidioKey"
}

variable "vpc_cidr_block" {
  type = string
}

variable "public-subnets" {
  type = list
}

variable "private-subnets" {
  type = list
}

variable "vpc_id" {
  type = string
}

variable "sg-terraform" {
  type = list
}

