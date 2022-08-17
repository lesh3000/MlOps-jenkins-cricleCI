pipeline {
  environment {
    imagename = "sklearn"
     credentials = credentialsId: "docker"
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
          dockerImage = docker.build imagename
        }
      }
    }
   
stage('Deploy Master Image') {
      steps{
        script {
          docker.withRegistry("dmitrylesh/sklearn", credentials) {     
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }

} //end of pipeline
