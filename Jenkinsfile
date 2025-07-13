pipeline {
  agent any

  environment {
    DOCKER_USER = 'madhusudhan143'
    IMAGE_NAME = 'mern-thinkboard-prod'
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

    stage('Push to Docker Hub (Private Prod Repo)') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
            echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
            docker push $DOCKER_USER/$IMAGE_NAME-backend
            docker push $DOCKER_USER/$IMAGE_NAME-frontend
          '''
        }
      }
    }

    stage('Deploy on EC2 (Prod)') {
      steps {
        sh '''
          docker rm -f thinkboard-backend || true
          docker rm -f thinkboard-frontend || true
          docker-compose down || true
          docker-compose up -d
        '''
      }
    }
  }
}

