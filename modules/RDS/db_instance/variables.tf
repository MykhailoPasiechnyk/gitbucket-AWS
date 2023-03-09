variable "allocated_storage" {
  default = 10
}

variable "db_name" {
  type    = string
  default = null
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "5.7"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_username" {
  type    = string
  default = null
}

variable "db_password" {
  type    = string
  default = null
}

variable "parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "db_subnet_group_name" {
  type    = string
  default = null
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}
