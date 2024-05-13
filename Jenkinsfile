pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'ls'
                sh 'cd angular-app'
                sh 'cd dist\angular-app'
                sh 'ls'
                sh 'cd browser'
                sh 'ls'
            }
        }
        // stage('S3 Upload') {
        //     steps {
        //         withAWS(region: 'us-east-1', credentials: 'da5fea22-4d26-4fb9-b524-85eb92f705d5') {
        //             sh 'ls -la'
        //             sh 'aws s3 cp build.zip s3://jensk-1/'
        //         }
        //     }
        // }
        // stage('Deploy with CodeDeploy') {
        //     steps {
        //         sh 'aws deploy create-deployment --application-name jen-app \
        //             --deployment-group-name react-sk \
        //             --s3-location bucket=jensk-1,key=build.zip,bundleType=zip'
        //     }
        // }
    }
}
