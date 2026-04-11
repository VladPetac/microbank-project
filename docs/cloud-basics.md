# Cloud concepts for MicroBank

## Why Cloud?
Banks are migrating to cloud for:
- Scalability: handle more customers during peak hours
- Reliability: multiple data centers, automatic failover
- Cost: pay for what you use, no upfront hardware purchase

## Major Cloud Providers
- **AWS (Amazon)**: Most popular, most services
- **Azure (Microsoft)**: Popular with enterprises using Microsoft stack
- **GCP (Google)**: Strong in data analytics and Kubernetes (GKE)

## Key Services (using AWS names as example)

| Service | AWS Name | What It Does |
|---------|----------|--------------|
| Virtual Machine | EC2 | A computer in the cloud |
| Container Service | EKS | Managed Kubernetes cluster |
| Database | RDS | Managed PostgreSQL/MySQL |
| Object Storage | S3 | File storage (backups, logs) |
| Identity | IAM | Access control (who can do what) |
| Networking | VPC | Private network for your resources |
| Registry | ECR | Private Docker image registry |

## How MicroBank Would Deploy to Cloud
1. Create a VPC (private network)
2. Create an EKS cluster (managed kubernetes)
3. Push images to ECR (private registry)
4. Deploy using Helm to EKS
5. Set up monitoring (CloudWatch or Prometheus)
6. Configure IAM roles for least privilege

## For your learning (Free Tiers)
- AWS: 12-month free tier - t2.micro EC2, 750 hours/month
- GCP: $300 credit for 90 days
- Azure: $200 credit for 30 days + always-free services
