pipeline {
    agent any 
    environment {
        ACCCESS_KEY_ID = credentials ('ACCESS_KEY_ID')
        SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')

        hubUsername = credentials ('hub-username')
        hubPassword = credentials ('hub-password')
        version = "v3"

        // AWS_REGION = credentials ('AwsSecretLocation')
        // AWS_INSTANCE_TYPE = credentials ('InstanceType')
        // AWS_AMI_ID = credentials ('myAMI_ID')//"ami-0ed752ea0f62749af"
        // AWS_KEY_NAME = credentials ('myKey')
    }

    stages {
        stage ('download the repo codebase') {
            steps {
                echo "download the project config file"
                sh "git clone https://github.com/SoftwareDevDeveloper/hrapp-project.git"
            }
        }
        stage('Build the docker image') {
            steps  {
                sh '''
                    cd hrapp-project
                    docker build -t 02271589/proj:$version .
                '''
            }
        }

        stage('Run docker image') {
            steps  { 
                sh 'docker run --name mypruser -d -p 80:5000 02271589/proj:$version'
            }
        }

        stage ('login to the image repo') {
            steps {
                echo "login to docker hub repo"
                  sh'docker login -u $hubUsername -p $hubPassword'
            }
        }

        stage ('publish image to dockerhub') {
            steps {
                echo "Push image to the Image repo"
                  sh'docker push 02271589/proj:$version'     
            }
        }

        // stage ('Launch EC2 Instances') {
        //     steps {
        //         echo "Lauch 3 EC2 instances"
        //         sh '''
        //            count = 3
        //            instanceType = $AWS_INSTANCE_TYPE
        //            Ami = $AWS_AMI_ID
        //            Key_name = $AWS_KEY_NAME
        //            instance_region = $AWS_REGION
        //            '''
        //     }
        // }

        // stage ('Deploy hrapp to nodes') {
        //     steps {
        //         sh 'docker run 02271589/proj:v2'
        //     }
        // }

        // stage ('Initialize terraform') {
        //     steps {
        //         echo "Terraform init"
        //           sh ('terraform init')   
        //     }
        // }

        // stage ('Plan terraform') {
        //     steps {
        //         echo "Terraform plan"
        //           sh ('terraform plan')   
        //     }
        // }

        // stage ('Execute terraform') {
        //     steps {
        //         echo "Terraform Apply"
        //           sh ('terraform apply -auto-approve')   
        //     }
        // }   
     }

    post {
        always {
            deleteDir()
        }
    }
}