pipeline {
    agent any

    // Adiciona o trigger para GitHub webhook
    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                // Faz checkout do repositório Git
                checkout scm
            }
        }

        stage('Executar Shell Script') {
            steps {
                script {
                    // Executa um shell script diretamente no Jenkinsfile
                    sh '''
                        echo "Iniciando o shell script..."
                        echo "Diretório atual: $(pwd)"
                        echo "Listando arquivos no diretório:"
                        ls -la
                        echo "Criando um arquivo de teste..."
                        echo "Conteúdo do arquivo" > teste.txt
                        echo "Shell script concluído!"
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Exemplo: Construir uma imagem Docker
                    sh '''
                        echo "Construindo a imagem Docker..."
                        docker build -t minha-imagem:latest .
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline concluído com sucesso!'
        }
        failure {
            echo 'Pipeline falhou. Verifique os logs para mais detalhes.'
        }
    }
}
