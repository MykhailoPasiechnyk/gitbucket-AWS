variable "region" {
  type    = string
  default = "eu-central-1"
}


#-----------EC2-----------------

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_ami" {
  type    = string
  default = "ami-070b208e993b59cea"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "user_data_file" {
  type    = string
  default = "user_data.sh.tpl"
}

variable "instance_name" {
  type    = string
  default = "GitBucket"
}


#---------Security Group---------

variable "security_group_name" {
  type    = string
  default = "Gitbucket Security Group"
}

variable "security_group_description" {
  type    = string
  default = "Security Group for Gitbucket"
}

variable "allow_ports" {
  description = "List of Ports to open for server"
  type        = list(any)
  default     = ["8080"]
}


#---------Common Tags----------

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map(any)
  default = {
    Owner   = "Mykhailo Pasiechnyk"
    Project = "gitbucket"
  }
}


#-------------DB--------------

variable "db_name" {}

variable "db_username" {}

variable "db_password" {}
