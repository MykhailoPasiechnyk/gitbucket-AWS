output "gitbucket_security_group_id" {
  value = aws_security_group.gitbucket.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}


output "efs_security_group_id" {
  value = aws_security_group.efs.id
}
