resource "aws_db_subnet_group" "rds" {
  name        = var.rds_subnet_group_name
  description = var.description
  subnet_ids  = var.subnet_ids

  tags = var.tags
}

