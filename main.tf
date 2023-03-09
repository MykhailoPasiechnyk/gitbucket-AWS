#-----------------------------------------------------
# Gitbucket Terraform
#
# Made by Mykhailo Pasiechnyk
#-----------------------------------------------------

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/aws_network"
}

module "ec2_instance" {
  source                      = "./modules/EC2"
  instance_count              = var.instance_count
  instance_ami                = var.instance_ami
  instance_type               = var.instance_type
  user_data_file              = var.user_data_file
  instance_security_group_ids = [module.security_groups.gitbucket_security_group_id]
  public_subnet_id            = module.vpc.public_subnet_ids[0]
  common_tags                 = var.common_tags
  instance_name               = var.instance_name
  db_url                      = module.mysql_instance.db_endpoint
  db_name                     = module.mysql_instance.db_name
  db_user                     = module.mysql_instance.db_username
  db_passwd                   = module.mysql_instance.db_password
  efs_ip                      = module.efs.efs_file_system_ip
}

module "security_groups" {
  source                 = "./modules/aws_security_group"
  security_groups_vpc_id = module.vpc.vpc_id
  common_tags            = var.common_tags
}

module "db_subnet_group" {
  source     = "./modules/RDS/db_subnet_group"
  subnet_ids = module.vpc.private_subnet_ids
}

module "mysql_instance" {
  source                 = "./modules/RDS/db_instance"
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  db_subnet_group_name   = module.db_subnet_group.rds_subnet_group_name
  vpc_security_group_ids = [module.security_groups.rds_security_group_id]
}


module "efs" {
  source            = "./modules/EFS"
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security_groups.efs_security_group_id
}

