pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dokerhub')
		imageName = "docker-image"
                registryCredentials = "dockerhub"
                registry = "18.212.33.180:8085/"
        dockerImage = ''
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
stage('Pre Prod..') {
     steps{  
         script {
             sh ' docker run -it -d -p 9090:9090 --name demo localhost:8085/docker-image'
        }
      }
    }
}


