variable "rds_subnet_group_name" {
  default = "main"
}

variable "description" {
  type    = string
  default = "DB subnet group"
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "tags" {
  type = map(string)
  default = {
    Name = "Gitbucket db subnet group"
  }
}
