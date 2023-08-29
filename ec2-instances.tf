resource "aws_instance" "appnode" {

  count         = 3
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_name

  tags = {
    Name = "HrApp_Server"
  }
}


















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



# post {
#         always {
#             script {
#                 sh 'terraform destroy -auto-approve'
#             }
#         }
#     }