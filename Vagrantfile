# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "debian/jessie64"
  # Just use the insecure_private_key for convenience
  config.ssh.insert_key = false

    (1..3).each do |i|
      config.vm.define "elastic-#{i}" do |node|
        node.vm.hostname = "elastic-#{i}"
        node.vm.network "forwarded_port", guest: 9200, host: "920#{i}"
        node.vm.provision :shell, path: "bootstrapAnsible.sh"
        node.vm.network "public_network", bridge: "wlan0"

        node.vm.provider "virtualbox" do |vb|
             # Don't boot with headless mode
             vb.gui = false
             vb.name = "Elastic#{i}"

             # Use VBoxManage to customize the VM. For example to change memory:
             vb.customize ["modifyvm", :id, "--memory", "2048"]
             #vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
             #vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
        end

        node.vm.provision "ansible" do |ansible|
            ansible.playbook = "./ansible/elastic.yml"
        end
      end
    end

  config.vm.define "junior" do |junior|
    junior.vm.hostname = "junior"
    junior.vm.network "forwarded_port", guest: 8081, host: 8081
    junior.vm.provision :shell, path: "bootstrapAnsible.sh"
    #junior.vm.network "private_network", ip: "192.168.22.20"
    junior.vm.network "public_network"

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
