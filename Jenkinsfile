pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'ls'
                sh 'cd /dist'
                sh 'cd /angular-app'
                sh 'ls'
		            sh 'zip -r browser.zip browser'
            }
        }
        stage('S3 Upload') {
            steps {
                withAWS(region: 'us-east-1', credentials: 'da5fea22-4d26-4fb9-b524-85eb92f705d5') {
                    sh 'ls -la'
                    sh 'aws s3 cp build.zip s3://sk-jenkins-angular/'
                }
            }
        }
        stage('Deploy with CodeDeploy') {
            steps {
                sh 'aws deploy create-deployment --application-name sk-angular \
                    --deployment-group-name test-angular \
                    --s3-location bucket=sk-jenkins-angular,key=build.zip,bundleType=zip'
            }
        }
    }
}
