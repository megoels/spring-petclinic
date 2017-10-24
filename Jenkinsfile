pipeline {
   agent { label 'petclinic-ci' }
   //agent any
   stages {
        stage('Preparation') {
            steps { 
                deleteDir()
                checkout scm 
            }
        }
        stage('Build') {
            steps { 
                sh "'${WORKSPACE}/mvnw' clean package"
            }
        }
   }
   post('Results') {
        success { 
            archive 'target/*.war,target/**/*.jar'
        }
        failure {
            mail body: "Please check the errors here: ${env.BUILD_URL}" ,
                from: 'megoels4tests@gmail.com',
                replyTo: 'mego20els@hotmail.com',
                subject: "The Jenkins job ${env.JOB_NAME} failed",
                to: 'mego20els@hotmail.com'
        }
        always {
            junit 'target/**/TEST-*.xml'
        }
   }
}
