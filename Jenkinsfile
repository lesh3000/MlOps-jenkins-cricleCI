pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'aws s3 ls'
            }
        }
    }
}