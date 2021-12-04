
# Installation
https://www.jenkins.io/doc/book/installing/linux/
- went through the jenkins installation and figured out what was needed. then created a playbook


# DOcker installation

docker-file.yml
```
version: "3.5"
services:
    jenkins:
        container_name: jenkins-docker
        image: jenkins/jenkins:lts
        ports:
            - 8080:8080
        networks:
            - jenkinsnetwork
networks:
    jenkinsnetwork:
```

```
docker network create -d bridge devnetwork
docker-compose config
docker exec -it jenkins-docker bash
docker exec -it jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword
```


```
ansible-playbook -i ../inventories/hosts -K install-jenkins.yml
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

- create a test job. echo out variable, then look at
- See the list of available environment variables
- show off the workspace folder and how to download files
```
echo $BUILD_NUMBER
echo $BUILD_URL
echo $BUILD_ID
ls -ltr $WORKSPACE
echo "test data1" >> $WORKSPACE/File1.txt
echo "test data2" >> $WORKSPACE/File2.txt

```

- show postbuild actions to trigger another build. show upstream/downstream projects


- Get your projects in github. do some basic tests.


Build Triggers
- Trigger build remotely (talk about how you can use webhooks to do it).
- Github hook trigger (Github -> Settings -> Webhooks -> github-webhook - application/json - just push event - active )
- Githuib public Ip address show it off talk about firewall settings that will need to be opened


# Scripted/Declatative pipeline
- what is the difference...?

## Pipeline
Clone - Build - Test - Package - Deploy
new -> pipeline -> pipeline tab -> try sample pipeline

https://medium.com/geekculture/jenkins-pipeline-python-and-docker-altogether-442d38119484

## Managing jenkins
https://www.jenkins.io/doc/book/managing/
-> creating slaves
-> managing plugins
-> ssh key management

## SSH Key Management
pipeline {
    agent {
        node {
            label 'agent1'
        }
    }
    stages {
        stage('Docker') {
            steps {
                sh "whoami"
                sh "docker info"
                sh "docker ps"
            }
        }
    }
}

# Plugins
Install these plugins:
Docker plugin
Docker Pipeline


# Remote agents
sudo useradd -d /var/lib/jenkins jenkins
ssh-keygen
ssh-copy-id


# Declative vs Scripted Pipelines
- Same thing, but syntax is different
- We will use Declarative, as it's easier to start out with.
- Just be aware that if you are looking at examples on the internet, that they may be using scripted, and thats why the syntax is different.
- once you get proficient with declarative, then you can venture off and try out scripted


Pipeline syntax differences
Declarative pipelines always begin with the word pipeline. Scripted pipelines, on the other hand, always begin with the word node. Declarative pipelines break down stages into individual stages that can contain multiple steps. Scripted pipelines use Groovy code and references to the Jenkins pipeline DSL within the stage elements without the need for steps.

These are the key differences that allow a developer to quickly differentiate between a scripted pipeline and a declarative pipeline.