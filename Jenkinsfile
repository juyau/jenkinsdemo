pipeline {
    agent {
        label 'agent'
    }

    stages {
        stage('check env') {
            steps {
                sh '''java -version
                git --version
                mvn -version'''
            }
        }

        stage('pull from git') {
            steps {
                echo 'pull from git'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '6aceade2-91c3-40a8-8c7e-b00c75acb50d', url: 'https://github.com/sydneyfullstack/jenkinsdemo.git']]])
            }
        }

        stage('hello from git file') {
                    steps {
                        echo 'hello from git file'
                    }
                }
    }

}
