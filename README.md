[Tutorial](https://serversforhackers.com/an-ansible-tutorial)


* vagrant up
* vagrant ssh
* wheezy: sudo apt-get install python-software-properties
* sudo apt-add-repository -y ppa:ansible/ansible
* sudo apt-get update
* sudo apt-get install -y ansible
* In /etc/ansible/hosts:
```
[local]
127.0.0.1
```

```
In:
/etc/ansible/ansible.cfg or ~/.ansible.cfg:

[defaults]
host_key_checking = False

```

* cd /vagrant/ansible
* Test: ansible local -m ping -s -k -u vagrant
* Provision: ansible-playbook -s -k -u vagrant server.yml
```
password: vagrant
```
