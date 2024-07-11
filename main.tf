provider "aws" {
  region = "us-east-1"  # North Virginia
}

module "vpc" {
  source = "./vpc"
  cidr_block = var.cidr_block
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
}

module "route-table" {
  source = "./route-table"
  vpc_id = module.vpc.vpc_id
  public_subnets = var.public_subnets
  igw_id = module.vpc.igw_id
  //route_table_id = module.route-table.id

  depends_on = [ module.vpc ]
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./ec2"
  ami_id = var.ami_id
  ec2_sg_id = module.security_groups.ec2_sg_id
  instance_type= var.instance_type
  public_subnet_id = element(module.subnets.public_subnet_ids, 0)
}

module "elb" {
  source = "./elb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.subnets.public_subnet_ids
  elb_sg_id = module.security_groups.elb_sg_id
}

module "asg" {
  source = "./asg"
  private_subnets = module.subnets.private_subnet_ids
  launch_template_sg = module.security_groups.asg_sg_id
  elb_target_group_arn = module.elb.target_group_arn
  ami_id = var.ami_id
  ec2_instance_id = module.ec2.ec2_instance_id
  instance_type = var.instance_type
}

module "rds" {
  source = "./rds"
  private_subnets = module.subnets.private_subnet_ids
  db_sg_id = module.security_groups.db_sg_id
  db_name = var.db_name
  db_password = var.db_password
  db_username = var.db_username
}

# module "route53" {
#   source = "./route53"
#   domain_name = var.domain_name
#   zone_id = var.zone_id
#   elb_dns_name = module.elb.elb_dns_name
#   elb_zone_id = module.elb.elb_zone_id
# }
