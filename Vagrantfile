# -*- mode: ruby -*-

# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "development"

  config.vm.define "development" do |machine|
    machine.vm.box = "ubuntu"
    machine.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    machine.vm.network "private_network", ip: "192.168.204.10"
    machine.vm.provider "virtualbox" do |v|
      v.cpus = 2
      v.memory = 4 * 1024
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "dev-vagrant.yml"
    end

    machine.vm.synced_folder "~/data", "/home/vagrant/data"
    machine.vm.synced_folder "~/.dotfiles", "/home/vagrant/.dotfiles"
    machine.vm.synced_folder "~/Downloads", "/home/vagrant/Downloads"
    machine.vm.synced_folder "~/dev", "/home/vagrant/dev", nfs: true, mount_options: ['rw', 'vers=3', 'tcp', 'fsc']
    machine.vm.synced_folder "~/data/rps_data", "/data"
  
    config.vm.provider "virtualbox" do |v|
      v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
    end
  end
end
