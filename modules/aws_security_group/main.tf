#---------------Security Group for EC2 Instance------------------

resource "aws_security_group" "gitbucket" {
  name        = var.security_group_server_name
  description = var.security_group_server_description
  vpc_id      = var.security_groups_vpc_id

  dynamic "ingress" {
    for_each = var.allow_server_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.protocol_tcp
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, { Name = var.security_group_server_name })
}


#--------------------Security Group for RDS-------------------

resource "aws_security_group" "rds" {
  name        = var.security_group_db_name
  description = var.security_group_db_description
  vpc_id      = var.security_groups_vpc_id

  ingress {
    from_port       = var.allow_db_port
    to_port         = var.allow_db_port
    protocol        = var.protocol_tcp
    security_groups = ["${aws_security_group.gitbucket.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_db_name
  }
}


#---------------Security Group for EFS---------------

resource "aws_security_group" "efs" {
  name        = var.security_group_efs_name
  description = var.security_group_efs_description
  vpc_id      = var.security_groups_vpc_id

  ingress {
    from_port       = var.efs_port
    to_port         = var.efs_port
    protocol        = var.protocol_tcp
    security_groups = ["${aws_security_group.gitbucket.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
