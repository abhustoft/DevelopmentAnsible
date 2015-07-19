# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "elastic1" do |elastic1|
    elastic1.vm.hostname = "elastic"
    elastic1.vm.network "forwarded_port", guest: 9200, host: 9200
    elastic1.vm.provision :shell, path: "bootstrapAnsible.sh"
    elastic1.vm.network "private_network", ip: "192.168.22.10"

    elastic1.vm.provider "virtualbox" do |vb|
         # Don't boot with headless mode
         vb.gui = false
         vb.name = "ElasticVM1"

         # Use VBoxManage to customize the VM. For example to change memory:
         vb.customize ["modifyvm", :id, "--memory", "2048"]
    end

    elastic1.vm.provision "ansible" do |ansible|

        ansible.sudo = true
        ansible.sudo_user = 'root'
        ansible.ask_sudo_pass = true

        ansible.playbook = "./ansible/elastic.yml"

        ansible.groups = {
            "elastic" => ["elastic1", "elastic2"],
            "junior" => ["junior"]
        }
    end
  end

  config.vm.define "elastic2" do |elastic2|
      elastic2.vm.hostname = "elastic"
      elastic2.vm.network "forwarded_port", guest: 9200, host: 9201
      elastic2.vm.provision :shell, path: "bootstrapAnsible.sh"
      elastic2.vm.network "private_network", ip: "192.168.22.11"

      elastic2.vm.provider "virtualbox" do |vb|
           # Don't boot with headless mode
           vb.gui = false
           vb.name = "ElasticVM2"

           # Use VBoxManage to customize the VM. For example to change memory:
           vb.customize ["modifyvm", :id, "--memory", "2048"]
      end

      elastic2.vm.provision "ansible" do |ansible|

          ansible.sudo = true
          ansible.sudo_user = 'root'
          ansible.ask_sudo_pass = true

          ansible.playbook = "./ansible/elastic.yml"
          ansible.groups = {
            "elastic" => ["elastic1", "elastic2"],
            "junior" => ["junior"]
          }
      end
    end

  config.vm.define "junior" do |junior|
    junior.vm.hostname = "junior"
    junior.vm.network "forwarded_port", guest: 8081, host: 8081
    junior.vm.provision :shell, path: "bootstrapAnsible.sh"
    junior.vm.network "private_network", ip: "192.168.22.20"

    junior.vm.provider "virtualbox" do |vb|
         # Don't boot with headless mode
         vb.gui = false
         vb.name = "JuniorVM"

         # Use VBoxManage to customize the VM. For example to change memory:
         # vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    junior.vm.provision "ansible" do |ansible|

        ansible.sudo = true
        ansible.sudo_user = 'root'
        ansible.ask_sudo_pass = true
        #ansible.verbose = 'vvvv'

        ansible.playbook = "./ansible/junior.yml"
        ansible.groups = {
            "elastic" => ["elastic1", "elastic2"],
            "junior" => ["junior"]
        }
    end

  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

end
