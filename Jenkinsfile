pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh '/usr/local/bin/aws s3 ls'
            }
        }
    }
}