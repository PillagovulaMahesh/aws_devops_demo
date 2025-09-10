# AWS DevOps Demo Assignment

This repository contains a demo AWS DevOps project showcasing **Infrastructure as Code (IaC)**, **CI/CD pipelines**, and **containerized application deployment**.


---

## 🚀 Features

- **Infrastructure as Code** with Terraform (modular design for VPC, ECS, Service).
- **Three environments**: dev, staging, prod.
- **Containerized App**: Dockerized Node.js/Express app.
- **CI/CD**: GitHub Actions pipeline for build → test → deploy.
- **Deployment**: ECS Fargate with Application Load Balancer.
- **Secrets Management**: AWS Secrets Manager / SSM Parameter Store.
- **Logging & Monitoring**: CloudWatch Logs enabled for ECS tasks.

---

## 🏗️ Architecture

![Architecture Diagram](./docs/architecture.png)

- **App** container pushed to **Amazon ECR**.
- **ECS Fargate** service runs the container.
- **Application Load Balancer** exposes the service.
- **Terraform** provisions VPC, ECS, and supporting resources.
- **GitHub Actions** automates build/test/deploy.

---

## 🛠️ Tech Stack

- **AWS**: ECS (Fargate), ECR, ALB, VPC, IAM, CloudWatch.
- **IaC**: Terraform.
- **CI/CD**: GitHub Actions.
- **App**: Node.js + Express (containerized with Docker).

---

## ⚙️ Setup Steps

### 1. Clone Repo
git clone https://github.com/<your-username>/aws-devops-demo.git
cd aws-devops-demo


### 2. Build & Run Locally

cd app
npm install
npm start


### 3. Dockerize 

docker build -t demo-app . 
docker run -p 3000:3000 demo-app

### 4. Deploy Infrastructure

cd iac/envs/dev
terraform init
terraform apply

### 5. CI/CD Pipeline

Push to main → triggers GitHub Actions pipeline.
Pipeline builds Docker image, pushes to ECR, updates ECS service.



