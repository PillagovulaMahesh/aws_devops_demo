project        = "aws-devops-demo"
aws_region     = "us-east-1"

# VPC CIDR
vpc_cidr       = "10.1.0.0/16"

# ECS Service settings
container_name = "demo-app"
ecr_repo_url   = "123456789012.dkr.ecr.us-east-1.amazonaws.com/demo-app"
image_tag      = "latest"
container_port = 3000

# Run more tasks in production for HA
desired_count  = 2

# Optional DB secret (leave empty if no DB)
db_secret_arn  = ""
