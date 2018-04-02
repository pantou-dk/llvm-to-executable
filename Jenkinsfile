pipeline {
    agent any
    
    stages {
        stage('Create or Update BuildConfig') {
            steps {
                sh 'oc apply -f build-config.yaml'
            }
        }
    }
}
