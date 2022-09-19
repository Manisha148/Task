pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dokerhub')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t manishaverma/docker-image:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push manishaverma/docker-image:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
