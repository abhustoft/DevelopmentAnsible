[Tutorial](https://serversforhackers.com/an-ansible-tutorial)


* vagrant up
* vagrant ssh
* In /etc/ansible/hosts:
```
[local]
127.0.0.1
```
* sudo apt-add-repository -y ppa:ansible/ansible
* sudo apt-get update
* sudo apt-get install -y ansible
* cd /vagrant/ansible
* Test: ansible local -m ping -s -k -u vagrant
* Provision: ansible-playbook -s -k -u vagrant server.yml
```
password: vagrant
```
