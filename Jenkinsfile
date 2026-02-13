pipeline {
    agent any

    environment {
        CONTAINER_NAME = 'mywebsite-container'
        IMAGE_NAME = 'mywebsite'
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/vdthirumurugan12-web/my-first-app-.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
                    docker stop $CONTAINER_NAME
                    docker rm $CONTAINER_NAME
                fi
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 9090:5000 --name $CONTAINER_NAME --restart unless-stopped $IMAGE_NAME'
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
    }
}



