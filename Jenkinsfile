pipeline{
  agent any
  environment {
        imageName = "docker-image"
        registryCredentials = "dockerhub"
        registry = "ub.docker.com/repository/docker/manishaverma/manisha"
        dockerImage = ''
    }
  stages{
    stage('checkout'){
      steps{
         checkout([$class: 'GitSCM', branches: [[name: '**']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/Manisha148/Task.git']]])
      }
    }
     stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imageName
        }
      }
    }
    stage('Uploading to DockerHub') {
     steps{  
         script {
             docker.withRegistry( 'http://'+registry, registryCredentials ) {
             dockerImage.push('latest')
          }
        }
      }
    }
    stage('Pre Prod..') {
     steps{  
         script {
             sh ' docker run -it -d -p 9090:9090 --name demo localhost:ub.docker.com/repository/docker/manishaverma/manisha/docker-image'
        }
      }
    }
  }
}
