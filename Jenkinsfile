pipeline {
    agent any
    
    stages {
        stage('Create or Update BuildConfig') {
            sh 'oc apply -f build-config.yaml'
        }
    }
}
