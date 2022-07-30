pipeline {
  environment {
    imagename = "jsksjhsj/hacicenkins"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        scm
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}