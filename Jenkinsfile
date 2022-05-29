pipeline {
    agent any

    
    environment {
        AWS_ACCOUNT_ID="427229268417"
        AWS_DEFAULT_REGION="ap-south-1"
        DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        IMAGE_REPO_NAME="neerajguna/ctwordpress"
        IMAGE_TAG="latest"
      }

    stages {

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
