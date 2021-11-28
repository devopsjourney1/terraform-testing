
# Manual install commands
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
ansible --version
```


# Copy your id_rsa PRIVATE KEY on the host you will be running Ansible/Jenkins Jobs from
```
vi ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
```
# generating a new ssh key

```
ssh-keygen -t rsa -b 4096

```

ansible localhost -i inventory/hosts -m command -a hostname
ansible-playbook -i ./inventory/localhost -K install-jenkins.yml
ansible-playbook all-servers.yml -i inventory/localhost

sudo flask run --host=0.0.0.0 --port=80
# ansible-inventory -i hosts --graph  (only works macos maybe linux not wsl)