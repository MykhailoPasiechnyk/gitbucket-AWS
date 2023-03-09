variable "instance_count" {
  type    = number
  default = 0
}

variable "instance_ami" {
  type    = string
  default = null
}

variable "instance_type" {
  type    = string
  default = null
}

variable "user_data_file" {
  type    = string
  default = null
}

variable "instance_name" {
  type    = string
  default = null
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map(any)
  default     = {}
}

variable "instance_security_group_ids" {
  type    = list(string)
  default = []
}

variable "public_subnet_id" {
  type    = string
  default = null
}

variable "db_url" {
  type    = string
  default = null
}

variable "db_name" {
  type    = string
  default = null
}

variable "db_user" {
  type    = string
  default = null
}

variable "db_passwd" {
  type    = string
  default = null
}

variable "efs_ip" {
  type    = string
  default = null
}