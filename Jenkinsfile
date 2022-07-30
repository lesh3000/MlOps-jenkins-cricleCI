pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh '/usr/bin/aws s3 ls'
            }
        }
    }
}