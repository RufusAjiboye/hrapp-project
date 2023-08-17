pipeline {
    agent any 
    environment {
        username = credentials ('dockerhubusername')
        password = credentials ('dockerhubpassword')
        version = "v1"
    }
    stages {
        stage ('download the codebase') {
            steps {
                echo "download the project config file"
                sh "git clone https://github.com/SoftwareDevDeveloper/hrapp-project.git"
            }
        }

        stage('Build the docker image') {
            steps [
                sh '''
                    cd hrapp-project
                    docker build -t 02271589/projects100:$version .
                '''
            ]
        }
    }




    post {
        always {
            deleteDir()
        }
    }
}