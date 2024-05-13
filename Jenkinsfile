pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'ls'
		            sh 'npm install'
                sh 'echo N | ng analytics off'
                sh 'ng build'
                sh 'cd dist/angular-app && ls'
		            sh 'zip -r build.zip dist/angular-app/browser'
            }
        }
        stage('S3 Upload') {
            steps {
                with AWS(region: 'us-east-1', credentials: 'b478d5f4-f5c6-44e1-9892-5fd3916d0a96') {
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
