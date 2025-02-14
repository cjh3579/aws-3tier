variable "db_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "private_subnets" {
  type = list(string)
}
variable "db_sg_id" {}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
