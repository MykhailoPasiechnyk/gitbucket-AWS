output "efs_file_system_id" {
  value = aws_efs_file_system.efs.id
}

output "efs_file_system_ip" {
  value = aws_efs_mount_target.efs-mt.ip_address
}