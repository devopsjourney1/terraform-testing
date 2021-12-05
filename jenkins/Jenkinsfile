pipeline {
    agent { label 'agent1' }
    stages {
        stage('Checkout code') {
            steps {
                git(url: 'https://github.com/devopsjourney1/terraform-testing', branch: 'master')
            }
        }
        stage('Setup Environment') {
            steps {
                sh "docker stop \$(docker ps -a | grep -i mywebapp | awk '{ print \$1 }') || true"
                sh "docker rm \$(docker ps -a | grep -i mywebapp | awk '{ print \$1 }') || true"
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t mywebapp:${BUILD_NUMBER} docker/docker_app1/.'
            }
        }
        stage('Testing') {
            steps {
                sh 'docker run --publish 80:5000 -d mywebapp:${BUILD_NUMBER}'
                sh 'sleep 10'
                sh 'curl -f -s -LI localhost:80'
                sh "docker stop \$(docker ps -a | grep -i mywebapp:${BUILD_NUMBER} | awk '{ print \$1 }') || true"
            }
        }
        stage('Deploy') {             
            steps {
                sh "docker tag mywebapp:${BUILD_NUMBER} devopsjourney1/mywebapp:prod"
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
                  sh "echo ${password} | docker login --username ${username} --password-stdin"
                }
                sh "docker push devopsjourney1/mywebapp:prod"
            }
        }
    }
}

