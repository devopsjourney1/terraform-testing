
# If you are not getting docker permissions (and groups command doesnt show you in docker group yet)
# Docker rules out - "worked on my machine/worked in dev arguments"
# Tightly integrated with CI/CD
# CI CD to lint code, build docker image, run a test.
reboot server with ansible
docker build -t mywebapp .
docker run --publish 80:5000