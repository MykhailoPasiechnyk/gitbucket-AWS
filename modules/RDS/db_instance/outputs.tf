output "db_endpoint" {
  value = aws_db_instance.mysql_gitbucket.endpoint
}

output "db_name" {
  value = aws_db_instance.mysql_gitbucket.db_name
}

output "db_username" {
  value = aws_db_instance.mysql_gitbucket.db_name
}

output "db_password" {
  value = aws_db_instance.mysql_gitbucket.password
}
