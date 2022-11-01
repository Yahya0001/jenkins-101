pipeline {
    agent { 
        node {
            label 'docker-agent-python'
            }
      }
    triggers {
        pollSCM '*/5 * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd myapp
                python3 hello.py
                python3 hello.py --name=Brad
                '''
            }
        }
        stage('Dockerization') {
            steps {
                echo 'Dockerization....'
                sh '''
                cd ..
                docker build -t yahyaallaya/my-python-script:latest .
                '''
            }
        }
        stage('Push docker image') {
            steps {
                echo 'Deliver....'
                sh '''
                docker tag yahyaallaya/my-python-script:latest  allayayahya/python-test:0.1.1
                docker login -u allayayahya -p 92492@All
                docker push allayayahya/python-test:0.1.1
                '''
            }
        }
    }
}