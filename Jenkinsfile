pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'ls'
                sh 'npm install'
                sh 'echo N | ng analytics off'
                sh 'ng build'
                sh 'cp appspec.yml dist/angular-app/browser'
                sh 'cp -r scripts dist/angular-app/browser'
                sh 'cd dist/angular-app/browser && ls'
                sh 'zip -r build.zip .'
            }
        }
        stage('S3 Upload') {
            steps {
                withAWS(region: 'us-east-1', credentials: '9dc47d93-f065-48df-9d1e-562ac8922093') {
                    sh 'ls -la'
                    sh 'aws s3 cp build.zip s3://jensk-1/'
                }
            }
        }
        stage('Deploy with CodeDeploy') {
            steps {
                sh 'aws deploy create-deployment --application-name sk-angular \
                    --deployment-group-name test-angular \
                    --s3-location bucket=jensk-1,key=build.zip,bundleType=zip'
            }
        }
    }
}
