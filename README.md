# AWS EKS Complete Stack

This project provisions an AWS-hosted Kubernetes environment with a complete infrastructure setup, application deployment, monitoring, and CI/CD automation.

## 📌 Features
- VPC with public and private subnets (via Terraform)
- EKS cluster inside the VPC
- Application deployed using Helm
- Ingress controller for external access
- External Secrets integration (AWS Secrets Manager)
- Monitoring with Prometheus and Grafana
- CI/CD automation with GitHub Actions

## 📐 Architecture
![Architecture Diagram](./diagrams/architecture.png)

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/yourusername/DevOps-proj.git
cd DevOps-proj

```

### 2. Configure AWS Credentials
Ensure your AWS credentials are set via environment variables or AWS CLI.

### 3. Provision Infrastructure
```bash
cd terraform
terraform init
terraform apply -auto-approve
```

### 4. Configure Kubeconfig
```bash
aws eks update-kubeconfig --name my-cluster --region us-east-1
```

### 5. Deploy App & Monitoring Stack
```bash
helm upgrade --install my-app ./helm/app
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack -f ./helm/monitoring/prometheus-grafana-values.yaml
```

### 6. Apply External Secrets
```bash
kubectl apply -f k8s-manifests/secrets-manager/secret-store.yaml
```

## 🔐 Secret Management
- AWS Secrets Manager is used to store sensitive data.
- External Secrets Controller syncs secrets to Kubernetes.

## 📊 Monitoring
- Prometheus and Grafana are deployed via `kube-prometheus-stack`.
- Access Grafana:
  - URL: http://<load-balancer-dns> or http://grafana.local (if DNS is configured)
  - Default credentials: `admin/prom-operator`

## 🔄 CI/CD
GitHub Actions deploys the entire stack on push to `main` branch.
See `.github/workflows/ci-cd.yaml` for details.

## 📁 Folder Structure
Refer to the project root layout in this document.

## 🧹 Cleanup
```bash
cd terraform
terraform destroy -auto-approve
```

## 📄 License
MIT

---
Maintained by [Your Name](https://github.com/yourusername) ✨
