pipeline {
    agent any

    
    environment {
        registry = "neerajguna/ctwordpress"
        registryCredential = 'dockerhub'
        dockerImage = ''
        IMAGE_TAG = 'latest'
      }

    

    stages {

    stage('Cloning Git') {
      steps {
        git 'https://github.com/NeerajKumarGopal/clevertapdemo.git'
      }
    }
    
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$IMAGE_TAG"
        }
      }
    }
    
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }  
    
    stage('Terraform init'){
      steps{
          dir("/home/administrator/clevertap/wordpress") {
              sh 'sudo terraform init'
              }
            }
          }

    stage('Terraform plan'){
      steps{
             dir("/home/administrator/clevertap/wordpress") {
             sh 'sudo terraform plan'
            }
        }
    }


   stage('Terraform apply'){
     steps{
             dir("/home/administrator/clevertap/wordpress") {
             sh 'sudo terraform apply --auto-approve'
            }
        }
    }
  }
 }
