variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "image_tag" {
  description = "Tag of Docker image to deploy"
  type        = string
}

variable "ecr_repo_url" {
  description = "ECR repository URL"
  type        = string
}

variable "container_port" {
  description = "App container port"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}

variable "db_secret_arn" {
  description = "ARN of DB password stored in Secrets Manager"
  type        = string
  default     = ""
}
