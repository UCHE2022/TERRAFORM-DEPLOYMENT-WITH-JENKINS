pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/UCHE2022/TERRAFORM-DEPLOYMENT-WITH-JENKINS.git']]])            

          }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }

        stage ("terraform fmt") {
            steps {
                sh ('terraform fmt') 
            }
        }

                stage ("terraform validate") {
            steps {
                sh ('terraform validate') 
            }
        }

        stage ("terraform plan") {
            steps {
                sh ('terraform plan') 
            }
        }
        
        stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
    post {
           always {
             echo 'Slack Notifications.'
             slackSend channel: '#uk-cicd', //update and provide your channel name
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
            }
        }
}
