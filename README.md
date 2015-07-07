#Development environment for my private projects

Ansible stuff based on this tutorial: [Tutorial](https://serversforhackers.com/an-ansible-tutorial)
Tested on Vagrant: config.vm.box = "ubuntu/trusty64"


* vagrant up --provision
* vagrant ssh
* Edit /etc/ansible/hosts:
```
[local]
127.0.0.1
```
* Edit /etc/ansible/ansible.cfg or ~/.ansible.cfg:
```
[defaults]
host_key_checking = False
```

* cd /vagrant/ansible
* Test: ansible local -m ping -s -k -u vagrant
* Provision: ansible-playbook -s -k -u vagrant server.yml
password: vagrant
