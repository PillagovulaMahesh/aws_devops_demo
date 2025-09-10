terraform {
  required_version = ">= 1.3.0"

  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# ----------------------------
# Networking (VPC + Subnets)
# ----------------------------
module "vpc" {
  source   = "../../modules/vpc"
  vpc_name = "${var.project}-dev-vpc"
  cidr     = var.vpc_cidr
}

# ----------------------------
# ECS Cluster
# ----------------------------
module "ecs" {
  source        = "../../modules/ecs_cluster"
  cluster_name  = "${var.project}-dev-ecs"
}

# ----------------------------
# Fargate Service
# ----------------------------
module "service" {
  source            = "../../modules/fargate_service"
  cluster_id        = module.ecs.cluster_id
  service_name      = "${var.project}-dev-svc"
  container_name    = var.container_name
  image             = "${var.ecr_repo_url}:${var.image_tag}"
  container_port    = var.container_port
  desired_count     = var.desired_count
  aws_region        = var.aws_region
  log_group         = "/aws/ecs/${var.project}-dev"
  db_secret_arn     = var.db_secret_arn
}

# ----------------------------
# Outputs
# ----------------------------
output "service_url" {
  value = module.service.alb_dns
}
