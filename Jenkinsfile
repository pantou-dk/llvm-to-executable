pipeline {
    agent any
    
    stages {
        stage('Create Kubernetes Namespace') {
            steps {
                script {
                    def projectName = getProjectName()
                    createProject(projectName)
                    createKubernetesObjects(projectName)
                    createKubernetesObjects(projectName, 'test/')
                }
            }
        }
        
        stage('Build') {
            steps {
                script {
                    def projectName = getProjectName()
                    executeDockerBuilds(projectName)
                }
            }
        }
    
        stage('Promote to Catalog') {
            when {
                branch 'master'
            }
            steps {
                script {
                    def projectName = getProjectName()
                    createKubernetesImageObjects('openshift')
                    promoteImages(projectName, 'openshift')
                }
            }
        }
    }

    post {
        always {
            script {
                def projectName = getProjectName()
                deleteProject(projectName)
            }
        }
    }
}
