pipeline {
    agent any
 
    stages {
        stage('Build') {
            steps {
                // Checkout source code
                git 'https://github.com/your/repository.git'
 
                // Build your application
                sh 'mvn clean install'
 
                // Build Docker image
                sh 'docker build -t your-image-name .'
            }
        }
 
        stage('Deploy to Portainer') {
            steps {
                // Push Docker image to registry
                sh 'docker push your-image-name'
 
                // Use Portainer API to deploy the container
                script {
                    def portainerAPI = 'http://your-portainer-url/api/endpoints/1/docker/containers/create'
                    def containerConfig = '{"Image": "your-image-name"}'
 
                    def response = sh(script: "curl -X POST -H 'Content-Type: application/json' -d '${containerConfig}' ${portainerAPI}", returnStdout: true).trim()
 
                    // Extract container ID from the response
                    def containerId = readJSON(text: response).Id
 
                    // Start the container
                    sh "curl -X POST ${portainerAPI}/${containerId}/start"
                }
            }
        }
    }
}
