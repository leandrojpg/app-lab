pipeline {
    agent any

    environment {
        // Defina variáveis de ambiente para o nome da imagem e tag
        DOCKER_IMAGE = "meu-repositorio/meu-app"
        DOCKER_TAG = "latest"
        DOCKER_REGISTRY = "https://index.docker.io/v1/" // Docker Hub
        DOCKER_CREDENTIALS_ID = "docker-hub-credentials" // ID das credenciais do Docker no Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Faz checkout do repositório Git
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Constrói a imagem Docker a partir do Dockerfile
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Login no Docker Registry') {
            steps {
                script {
                    // Faz login no registro Docker (por exemplo, Docker Hub)
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS_ID) {
                        // Tag e push da imagem para o registro
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }

        stage('Limpeza') {
            steps {
                script {
                    // Remove a imagem local para liberar espaço
                    sh "docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        success {
            echo 'Build e push da imagem Docker concluídos com sucesso!'
        }
        failure {
            echo 'Falha no pipeline. Verifique os logs para mais detalhes.'
        }
    }
}
