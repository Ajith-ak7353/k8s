pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "Ajith7353/webpract"
        IMAGE_TAG = "latest"
        KUBE_CONFIG = "/home/ajith/.kube/config'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/Ajith-ak7353/k8s.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                script {
                   withDockerRegistry(credentialsId: '1f864436-96dd-415c-bd9e-16208f04229f', url: 'https://index.docker.io/v1/'){
                        dockerImage.push("${IMAGE_TAG}")
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml
                kubectl apply -f k8s/hpa.yaml
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                kubectl get pods
                kubectl get svc
                kubectl get hpa
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful!"
        }
        failure {
            echo "❌ Pipeline Failed!"
        }
    }
}
