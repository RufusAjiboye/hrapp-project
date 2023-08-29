pipeline {
    agent any 
    environment {
        ACCCESS_KEY_ID = credentials ('ACCESS_KEY_ID')
        SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')

        hub_username = credentials ('hub-username')
        hub_password = credentials ('hub-password')
        version = "v3"

        REGION = credentials ('REGION')
        INSTANCE_TYPE = credentials ('INSTANCE_TYPE')
        AMI_ID = credentials ('AMI_ID')
        KEY_NAME = credentials ('KEY_NAME')
        count = "3"
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
                sh 'docker run -d -p 80:5000 02271589/proj:$version'
            }
        }

        stage ('login to the image repo') {
            steps {
                echo "login to docker hub repo"
                  sh'docker login -u $hub_username -p $hub_password'
            }
        }

        stage ('publish image to dockerhub') {
            steps {
                echo "Push image to the Image repo"
                  sh'docker push 02271589/proj:$version'     
            }
        }

        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SoftwareDevDeveloper/hrapp-project.git']])
            }
        }

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

        stage ('Init terraform') {
            steps {
                echo "Initialise Terraform"
                sh 'terraform init'
            }
        }

        stage ('Execute terraform') {
            steps {
                echo "Terraform Apply"
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            deleteDir()
        }
    }
}
 

         























// post {
//         always {
//             script {
//                 sh 'terraform destroy -auto-approve'
//             }
//         }
//     }


    
        // stage ('Deploy hrapp to nodes') {
        //     steps {
        //         sh 'docker run 02271589/proj:v2'
        //     }
        // }



// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SoftwareDevDeveloper/hrapp-project.git/']])
//             }
//         }
//         stage ("Terraform init") {
//             steps {
//                 sh "terraform action from the parameter is --> ${action}"
//                 sh ("terraform ${action} --auto-approve");
//             }
//         }
//     }
// }
