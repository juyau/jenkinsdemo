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
                echo 'pull from git.....'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '6aceade2-91c3-40a8-8c7e-b00c75acb50d', url: 'https://github.com/sydneyfullstack/jenkinsdemo.git']]])
            }
        }

        stage('maven build') {
            steps {
                 echo 'maven build.....'
                 sh 'mvn clean package -Dmaven.test.skip=true'
            }
        }

        stage('docker build') {
            steps {
                 echo 'docker build'
                 sh 'docker rmi jenkinsdemo:1.0'
                 sh '''docker build --label jenkinsdemo --build-arg JAR_FILE=target/jenkinsdemo.jar -t hcoin/jenkinsdemo:1.0 .'''

            }
        }

        stage('docker run') {
            steps {
                 echo 'docker start to run.....'
                 sh 'docker stop jenkinsdemo'
                 sh 'docker rm jenkinsdemo -f'
                 sh 'docker run -itd --name jenkinsdemo -p 7777:8888 hcoin/jenkinsdemo:1.0'
            }
        }

    }

}
