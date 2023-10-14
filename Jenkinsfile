pipeline {
    agent any

    environment {
        ACCCESS_KEY_ID = credentials ('ACCESS_KEY_ID')
        SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')

        hub_username = credentials ('hub-username')
        hub_password = credentials ('hub-password')
        version = "v3"
    }

    stages {
        stage ('download the repo codebase') {
            steps {
                echo "download the project config file"
                sh "git clone https://github.com/SoftwareDevDeveloper/hrapp-project.git"
            }
        }

        // stage ('terraform init') {
        //     steps {
        //         sh '''
        //         terraform init --backend-config=../env/backend.tfvars
        //         '''
        //     }
        // }


        //  stage ('terraform apply') {
        //     steps {
        //         sh '''
        //         terraform apply --var-file ../env/backend.tfvars --var-file ../env/ec2.tfvars --auto-approve
        //         '''
        //     }
        // }

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
                sh 'docker run -d -p 80:5000 02271589/proj:$version'
            }
        }

        stage ('login to the image repo') {
            steps {
                echo "login to docker hub repo"
                  sh 'docker login -u $hub_username -p $hub_password'
            }
        }

        stage ('publish image to dockerhub') {
            steps {
                echo "Push image to the Image repo"
                  sh 'docker push 02271589/proj:$version'     
            }
        }  
    }

    post {
        always {
            deleteDir()
        }

         success {
            echo 'Build is successful'
        }

        failure {
            echo 'Build is not successful'
        }
    }
}






































// REGION = credentials ('region')
        // INSTANCE_TYPE = credentials ('InstanceType')
        // AMI_ID = credentials ('myKey')
        // KEY_NAME = credentials ('myAMI_ID')
        // count = "3"




        




// stage('Checkout') {
        //     steps {
        //         checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SoftwareDevDeveloper/hrapp-project.git']])
        //     }
        // }

        // stage ('Launch EC2 Instances') {
        //     steps {
        //        echo "Launch EC2 instances"
        //          sh '''
        //             INSTANCE_TYPE = $INSTANCE_TYPE
        //             AMI_ID = $AMI_ID
        //             KEY_NAME = $KEY_NAME
        //             REGION = $REGION
        //            '''
        //     }
        // }

        // stage ('Init terraform') {
        //     steps {
        //         echo "Initialise Terraform"
            //     withCredentials([string(credentialsId: 'ACCESS_KEY_ID', variable: 'ACCESS_KEY_ID'), string(credentialsId: 'SECRET_ACCESS_KEY', variable: 'SECRET_ACCESS_KEY')]) {
            //     sh 'aws_access_key_id=$ACCESS_KEY_ID aws_secret_access_key=$SECRET_ACCESS_KEY terraform init'
            //    }
        //     }
        // }

    //     stage ('plan terraform') {
    //         steps {
    //             echo "This will execute plan Terraform"
    //             sh 'terraform plan'
    //         }
    //     }

    //     stage ('Execute terraform') {
    //         steps {
    //             echo "Terraform Apply"
    //             sh 'terraform apply -auto-approve'
    //         }
    //     }