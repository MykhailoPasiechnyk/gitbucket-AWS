resource "aws_efs_file_system" "efs" {
  creation_token   = var.creation_token
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = var.encrypted
  tags = {
    Name = var.tag_name
  }
}

resource "aws_efs_mount_target" "efs-mt" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.subnet_id
  security_groups = ["${var.security_group_id}"]
}
