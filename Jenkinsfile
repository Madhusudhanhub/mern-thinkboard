pipeline {
  agent any

  environment {
    DOCKER_USER = 'madhusudhan143'
    IMAGE_NAME = 'mern-thinkboard-dev'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: env.BRANCH_NAME, url: 'https://github.com/Madhusudhanhub/mern-thinkboard.git'
      }
    }

    stage('Build Backend Image') {
      steps {
        sh 'docker build -t $DOCKER_USER/$IMAGE_NAME-backend ./backend'
      }
    }

    stage('Build Frontend Image') {
      steps {
        sh 'docker build -t $DOCKER_USER/$IMAGE_NAME-frontend ./frontend'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh 'echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin'
          sh 'docker push $DOCKER_USER/$IMAGE_NAME-backend'
          sh 'docker push $DOCKER_USER/$IMAGE_NAME-frontend'
        }
      }
    }

    stage('Deploy on EC2') {
      steps {
        sh 'docker-compose down || true'
        sh 'docker-compose up -d'
      }
    }
  }
}

