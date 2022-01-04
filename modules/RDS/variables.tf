
variable "vpc_id" {
  type = string
}

variable "private-subnets" {
  type = list
}

variable "dbusername" {
  default = "root"
}

variable "dbpassword" {
  default = "rootroot"
}