🚀 WebApp CI/CD Pipeline with Jenkins & Kubernetes (Minikube)
📌 Project Overview

This project demonstrates a complete CI/CD pipeline that:

Builds a Docker image

Pushes it (optional)

Deploys to Kubernetes

Exposes via NodePort

Configures Horizontal Pod Autoscaling (HPA)

All running locally using:

🧪 Minikube

⚙️ Jenkins

🐳 Docker

☸️ Kubernetes

🏗️ Architecture
Developer Push → Jenkins Pipeline → Docker Build
        ↓
   Kubernetes Deployment
        ↓
     Service (NodePort)
        ↓
   Horizontal Pod Autoscaler


⚙️ Prerequisites

Install on VM:

Docker

Minikube

kubectl

Jenkins

🚀 Setup Instructions
1️⃣ Start Minikube
minikube start


Enable metrics server (for HPA):

minikube addons enable metrics-server

2️⃣ Build Docker Image (If Manual)

If using Docker driver:

eval $(minikube docker-env)
docker build -t webapp:latest .

3️⃣ Deploy to Kubernetes
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f hpa.yaml

🔁 CI/CD Pipeline (Jenkins)

The Jenkins pipeline:

Pulls source code from GitHub

Builds Docker image

Deploys to Kubernetes

Applies HPA

To trigger:

Configure Jenkins job

Add GitHub repo

Run build

📈 Horizontal Pod Autoscaler

HPA configuration:

Min replicas: 2

Max replicas: 5

CPU target: 20%

🏆 What This Project Demonstrates

Containerization

CI/CD automation

Kubernetes deployments

Service exposure

Autoscaling

DevOps debugging skills

📌 Future Improvements

Ingress setup

HTTPS with TLS

Helm charts

GitOps with ArgoCD

Deploy to AWS EKS

👨‍💻 Author

Ajith

