provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
  region = "ap-northeast-2"
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.network.vpc_id
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.network.vpc_id
  public_subnets = module.network.public_subnets
  alb_sg_id = module.security_groups.alb_sg_id
}

module "autoscaling" {
  source = "./modules/autoscaling"
  vpc_id = module.network.vpc_id
  private_subnets = module.network.private_subnets
  web_sg_id = module.security_groups.web_sg_id
  alb_tg_arn = module.alb.tg_arn
}

module "database" {
  source = "./modules/database"
  vpc_id = module.network.vpc_id
  private_subnets = module.network.private_subnets
  db_sg_id = module.security_groups.db_sg_id
  db_instance_class = var.db_instance_class
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}
