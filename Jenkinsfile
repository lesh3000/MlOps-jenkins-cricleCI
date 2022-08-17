pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t dmitrylesh/sklearn:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push dmitrylesh/sklearn:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
