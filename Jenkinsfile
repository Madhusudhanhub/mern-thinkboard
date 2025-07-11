pipeline {
  agent any

  environment {
    DOCKERHUB_USER = 'madhusudhan143'
    BACKEND_IMAGE = "${DOCKERHUB_USER}/thinkboard-backend:prod"
    FRONTEND_IMAGE = "${DOCKERHUB_USER}/thinkboard-frontend:prod"
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: 'master', url: 'https://github.com/Madhusudhanhub/mern-thinkboard.git'
      }
    }

    stage('Build Docker Images') {
      steps {
        sh 'docker-compose -f docker-compose.yaml build'
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
            echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
            docker push $BACKEND_IMAGE
            docker push $FRONTEND_IMAGE
          '''
        }
      }
    }

    stage('Deploy') {
      steps {
        // Stops any running containers and frees ports
        sh 'docker-compose -f docker-compose.yaml down || true'
        
        // Starts the fresh containers
        sh 'docker-compose -f docker-compose.yaml up -d'
      }
    }
  }
}

