provider "aws" {
  region = var.aws_region

  # Profile can be set via CLI or environment variables
  # Example: export AWS_PROFILE=dev
  # Or rely on GitHub Actions OIDC for CI/CD
}
