// Example Jenkinsfile snippet
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Build your React app
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Deploy') {
            steps {
                // Push the built Docker image to your registry
                sh 'docker push your-registry/your-react-app:latest'
                
                // Deploy the updated stack to Portainer
                script {
                    docker.withRegistry('https://your-registry', 'your-registry-credentials') {
                        sh 'docker stack deploy -c docker-compose.yml your-stack-name'
                    }
                }
            }
        }
    }
}
