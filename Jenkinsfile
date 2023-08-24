pipeline {
    agent any 
    environment {
        ACCCESS_KEY_ID = credentials ('ACCESS_KEY_ID')
        SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')
        myusername = credentials ('hub-username')
        mypassword = credentials ('hub-password')
        version = "v2"
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
                    docker run --name myprus -d -p 80:5000 02271589/proj:$version
                '''
            }
        }

        stage ('publish image to repo') {
            steps {
                echo "login and push image to the repo"
                sh '''
                  docker login -u $myusername -p $mypassword
                  docker push 02271589/proj:$version
                  '''
            }
        }

        // stage ('deploy app to browser') {
        //     steps {
        //         echo "This will deploy the application"
        //         sh '''
                
        //     }
        // }
    }




    post {
        always {
            deleteDir()
        }
    }
}