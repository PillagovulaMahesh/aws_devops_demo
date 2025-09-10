# Design Decisions – AWS DevOps Demo Assignment

## 1. Infrastructure as Code (IaC)
- **Tool Chosen:** Terraform  
- **Reason:** Portable, modular, reusable across dev/staging/prod. Easier state management with remote backends (e.g., S3 + DynamoDB). Preferred over CloudFormation for flexibility.

## 2. Application Containerization
- **Tool Chosen:** Docker  
- **Reason:** Ensures the app runs consistently in local, CI, and AWS ECS environments. Fargate removes the need to manage EC2 hosts.

## 3. CI/CD Pipeline
- **Tool Chosen:** GitHub Actions  
- **Reason:** Native integration with GitHub repository, free tier available, easy to connect with AWS (via OIDC or secrets).  
- **Workflow:** Code push → build → test → Dockerize → push image → Terraform apply → ECS update.

## 4. Hosting & Deployment
- **Service Chosen:** AWS ECS (Fargate) + ALB  
- **Reason:** Serverless containers → no EC2 management. Scales automatically.  
- Alternative (for static React apps): S3 + CloudFront, but ECS shows deeper DevOps skills.

## 5. Secrets & Security
- **Tool Chosen:** AWS Secrets Manager / SSM Parameter Store  
- **Reason:** Prevents hardcoding secrets in repo or pipeline. IAM task roles provide fine-grained access.

## 6. Monitoring & Logging
- **Tool Chosen:** Amazon CloudWatch  
- **Reason:** Native logs and metrics integration with ECS. Supports alarms (CPU > 80%, etc.) and auto-scaling triggers.

## 7. Rollback Strategy
- Keep old ECS task definitions → rollback by redeploying previous revision.
- Optionally integrate AWS CodeDeploy Blue/Green (bonus).

## 8. Environment Strategy
- **Envs:** dev, staging, prod.
- Each env defined separately in Terraform (`/iac/envs/`) but reuses common modules (`/iac/modules/`).

---
