variable "creation_token" {
  type    = string
  default = "efs"
}

variable "performance_mode" {
  type    = string
  default = "generalPurpose"
}

variable "throughput_mode" {
  type    = string
  default = "bursting"
}

variable "encrypted" {
  type    = bool
  default = false
}

variable "tag_name" {
  type    = string
  default = "Efs-gitbucket"
}


#-------------EFS-mount-targret----------

variable "subnet_id" {
  type    = string
  default = null
}

variable "security_group_id" {
  type    = string
  default = null
}
