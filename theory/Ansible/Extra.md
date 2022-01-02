

# Ansible Facts + Conditionals
Whenever you run an Ansible playbook, ansible gathers information, or "facts" about the host. 
This can be very useful information, especially when making dynamic playbooks.
https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html

One example woudl be determining the type of OS
```
when: ansible_facts['os_family'] == 'Debian'
```


# Variables
{{}}

# Handlers
handlers:
- name: restart apache
service: name=apache2 state=restarted
tasks:
- name: Enable Apache rewrite module.
apache2_module: name=rewrite state=present
notify: restart apache
