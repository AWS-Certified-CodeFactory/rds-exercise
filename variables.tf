locals {
  common_tags = {
    org     = var.org
    env     = var.env
    project = "rds-exercise"
  }
}

variable "org" {
  description = "Name of the Organization"
  type        = string
  default     = "aws-exercise"
}

variable "env" {
  description = "Name of the Environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS Resources created region"
  type        = string
  default     = "us-east-1"
}

variable "rds_dbname" {
  default = "app_contents"
}

variable "rds_username" {
  default = "app_user"
}

variable "rds_password" {
  default = "test.123456"
}