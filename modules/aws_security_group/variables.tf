variable "security_groups_vpc_id" {
  type    = string
  default = null
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map(any)
  default     = {}
}

variable "protocol_tcp" {
    type = string
    default = "tcp"
}


#-----------Server security group vars-------------------

variable "security_group_server_name" {
  type    = string
  default = "Gitbucket Security Group"
}

variable "security_group_server_description" {
  type    = string
  default = "Security Group for Gitbucket"
}

variable "allow_server_ports" {
  description = "List of Ports to open for server"
  type        = list(any)
  default     = ["8080"]
}


#-----------DB security group vars-------------------

variable "security_group_db_name" {
  type    = string
  default = "rds_security_group"
}

variable "security_group_db_description" {
  type    = string
  default = "RDS MySQL server"
}

variable "allow_db_port" {
  type    = number
  default = 3306
}


#-----------------EFS security group vars-------------------

variable "security_group_efs_name" {
    type = string
    default = "efs"
}

variable "security_group_efs_description" {
    type = string
    default = "EFS security group"
}

variable "efs_port" {
  type    = number
  default = 2049
}