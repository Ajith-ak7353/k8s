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

📁 Project Structure
.
├── Dockerfile
├── Jenkinsfile
├── deployment.yaml
├── service.yaml
├── hpa.yaml
├── index.html
└── images/

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


Verify:

kubectl get pods
kubectl get svc
kubectl get hpa

🌐 Access the Application
If using NodePort

Check service:

kubectl get svc


Example:

webapp-service   NodePort   80:30010/TCP


Access in browser:

http://<VM-IP>:30010

If using Docker driver (Minikube)

Use port-forward:

kubectl port-forward svc/webapp-service 9090:80 --address 0.0.0.0


Then open:

http://<VM-IP>:9090

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

Check scaling:

kubectl get hpa

🛠️ Troubleshooting
Permission Issues

Fix Minikube & kubeconfig ownership:

sudo chown -R $USER:$USER ~/.kube
sudo chown -R $USER:$USER ~/.minikube

ImagePullBackOff

Add in deployment.yaml:

imagePullPolicy: Never


If using local image.

Service Not Reachable

If using Docker driver:

kubectl port-forward svc/webapp-service 9090:80 --address 0.0.0.0

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
