# Before Containers / Why we moved to containers

# Docker rules out - "worked on my machine/worked in dev arguments"
# Tightly integrated with CI/CD
# CI CD to lint code, build docker image, run a test.

# What containers actually are/ Difference between VMs
- Similar to Virtual Machines.
- Virtual Machines have a big footprint and a lot of overhead.  Ever OS consumes Storage, CPU, RAM, Licensing and other resources. 
Slow to boot and problems with portability.
- Don't have to run a full blown OS, are Fast to start/ultra portable
* get image of VM/Container
 Docker uses containerisation as a core technology, which relies on the concept of sharing a kernel between containers
 
 Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.

Namespaces are a feature of the Linux kernel that partitions kernel resources such that one set of processes sees one set of resources while another set of processes sees a different set of resources. The feature works by having the same namespace for a set of resources and processes, but those namespaces refer to distinct resources. Resources may exist in multiple spaces. Examples of such resources are process IDs, hostnames, user IDs, file names, and some names associated with network access, and interprocess communication.

Namespaces are a fundamental aspect of containers on Linux.

These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace.


https://docs.docker.com/get-started/overview/


# Docker

The most popular container tool for managing and developing anything related to containers is docker.


* docker image
https://docs.docker.com/engine/images/architecture.svg
- docker daemon listens for API requests
- docker client, is your docker binary that you use to send requests to the api with like dockerb build, pull run etc.
- docker images, they are templates with instructions for creating a Docker containers. 
    - Images are usually based on other images with a few additional customizations.
    - your custom images will include a base image of something like ubuntu from dockerhub, and have some customizations on it
    - Images are created using dockerfiles, each instruction in the dockerfile creates what we call layers of the image.
    - When you make changes to your dockerfile, only layers effected by the change will be rebuilt
- containers:   


# Dockerizing an APP

APP -> Dockerfile -> Docker image build (Build) -> builds layered image -> push image -> Image registry (SHIP) -> Run the container (Run)


# Tags


# Cheat Sheet
https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf


# Docker desktop
Docker Desktop is an easy-to-install application for your Mac or Windows environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (dockerd), the Docker client (docker), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper. For more information, see Docker Desktop.
