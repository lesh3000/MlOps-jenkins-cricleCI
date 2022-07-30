pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                aws s3 ls
            }
        }
    }
}