variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}
variable "web_sg_id" {}
variable "alb_tg_arn" {}


