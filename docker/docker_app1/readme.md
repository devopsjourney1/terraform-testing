
# If you are not getting docker permissions (and groups command doesnt show you in docker group yet)
# Docker rules out - "worked on my machine/worked in dev arguments"
# Tightly integrated with CI/CD
# CI CD to lint code, build docker image, run a test.

docker run hello-world

sudo apt install python3-flask
export FLASK_APP=app.py
flask run

curl localhost:5000
curl localhost:5000

curl -I localhost:5000
curl -I localhost:5000/bad

reboot server with ansible
docker build -t mywebapp .
docker run --publish 80:5000 mywebapp:latest
docker exec 69a4e3ff6652 'apk list'
