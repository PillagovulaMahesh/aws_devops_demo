# AWS DevOps Demo App

This is a sample Node.js Express application used for AWS DevOps demo (CI/CD + IaC + Containerization).

---

## Features
- Simple Express.js server with two endpoints:
  - `/` → returns a welcome message
  - `/health` → returns JSON health check (for ECS/ALB)
- Runs locally, in Docker, or on AWS ECS Fargate.

---

## Local Setup
```bash
cd app
npm install
npm start
