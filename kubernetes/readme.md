


# Bring up a virtual machine using vagrant
```
vagrant up
vagrant ssh
```

# Install Minikube
```
sudo apt update
sudo apt install docker.io -y
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
sudo usermod -a -G docker vagrant
# Need to refresh user permissions
exit 
vagrant ssh
minikube start --driver=docker
minikube status
```


# Install Kubectl
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
alias k='kubectl'
```


kubectl describe nodes | grep -i address -A 2
curl 192.168.49.2:31696 (node IP + node port)

# Create a Pod
- Labels
- Resources




# Create a Service



# Create a Deployment




kubectl rollout restart deployment mypod