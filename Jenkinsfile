pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ajith7353/webpract"
        IMAGE_TAG = "latest"
        KUBECONFIG = "/home/ajith/.kube/config"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'master',
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
                    withDockerRegistry(credentialsId: '19a2f8a3-0651-4991-a661-244efc6ef795', url: 'https://index.docker.io/v1/') {
                        dockerImage.push("${IMAGE_TAG}")
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                export KUBECONFIG=/home/ajith/.kube/config
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml
                kubectl apply -f k8s/hpa.yaml
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                export KUBECONFIG=/home/ajith/.kube/config
                kubectl get pods
                kubectl get svc
                kubectl get hpa
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Pipeline Failed!"
        }
    }
}
