pipeline {
    agent any 
    environment {
        ACCCESS_KEY_ID = credentials ('ACCESS_KEY_ID')
        SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')
        username = credentials ('username')
        password = credentials ('password')
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
                    docker run --name mypros -d -p 80:5000 02271589/proj:$version
                '''
            }
        }

        stage ('publish image to repo') {
            steps {
                echo "login and push image to the repo"
                sh '''
                  docker login -u $username -p $password
                  docker push 02271589/proj:$version
                  '''
            }
        }

        // stage ('deploy app to browser') {
        //     steps {
        //         echo "This will deploy the application"
        //         sh '''
        //             docker run -p 91:5000 -e POSTGRES_HOST=project.cj8fxkx2ctxo.eu-west-1.rds.amazonaws.com /
        //             -e POSTGRES_USER=project -e POSTGRES_PASSWORD=password123 /
        //             -e POSTGRES_DATABASE_NAME=postgres -e TO_ADDRESS=ruufman@yahoo.com /
        //             -e SOURCE_ADDRESS=ruufman@gmail.com -e AWS_REGION_NAME=eu-west-1 /
        //             -e AWS_ACCESS_NAME=AKIAZB6KW5VE6KBBYYTU /
        //             -e AWS_KEY_NAME=kOoq4ozR2jIe7bkp1pEnwEXRFowboOECzgwp/dff 02271589/proj:v1
        //             '''
        
        //     }
        // }
    }




    post {
        always {
            deleteDir()
        }
    }
}