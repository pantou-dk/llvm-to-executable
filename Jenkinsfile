pipeline {
    agent any
    
    stages {
        stage('Create Kubernetes Namespace') {
            steps {
                println env.BUILD_TAG
                sh 'oc apply -f image-stream.yaml'
                sh 'oc apply -f build-config.yaml'
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    openshift.withCluster() {
                        def imageBuild = openshift.selector('bc/llvm-to-executable')
                        def buildExecution = imageBuild.startBuild()
                        buildExecution.logs('-f')
                    }
                }
            }
        }
    }
}
