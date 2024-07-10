provider "aws" {
  region = "us-east-1"  # North Virginia
}

module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./ec2"
  public_subnet_id = element(module.subnets.public_subnet_ids, 0)
}

module "elb" {
  source = "./elb"
  subnets = module.subnets.public_subnet_ids
  elb_sg_id = module.security_groups.elb_sg_id
}

module "asg" {
  source = "./asg"
  private_subnets = module.subnets.private_subnet_ids
  launch_configuration_sg = module.security_groups.asg_sg_id
  elb_target_group_arn = module.elb.target_group_arn
}

module "rds" {
  source = "./rds"
  private_subnets = module.subnets.private_subnet_ids
  db_sg_id = module.security_groups.db_sg_id
}

module "route53" {
  source = "./route53"
  elb_dns_name = module.elb.elb_dns_name
  elb_zone_id = module.elb.elb_zone_id
}
