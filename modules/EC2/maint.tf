resource "aws_instance" "gitbucket" {
  count                  = var.instance_count
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.instance_security_group_ids
  subnet_id              = var.public_subnet_id
  user_data = templatefile(var.user_data_file, {
    db_url    = var.db_url,
    db_name   = var.db_name,
    db_user   = var.db_user,
    db_passwd = var.db_passwd,
    efs_ip    = var.efs_ip
  })

  tags = merge(var.common_tags, { Name = var.instance_name })
}
