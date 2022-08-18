pipeline {
  environment {
    registry = "dmitrylesh/sklearn"
    registryCredential = 'dockerhub'
    dockerImage = ''
    USER_CREDENTIALS = credentials('aws')
    
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
     stage('pull image and train model') {
      steps{
        sh "docker pull $registry:$BUILD_NUMBER"
        sh "export key_id=$USER_CREDENTIALS_USR"
        sh "export secret_key=$USER_CREDENTIALS_PSW"
        sh "docker run -e secret_key -e key_id --rm $registry:$BUILD_NUMBER"
      }
    }
  }
}

