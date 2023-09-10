# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

# VM 1 Gateway
  config.vm.box = "ubuntu/focal64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
  config.vm.define "gateway-vm" do |gateway|
    
    gateway.vm.network "private_network", ip: "192.168.56.254"
    
    gateway.vm.network "public_network", type: "dhcp", bridge: "wlp0s20f3"
    
    gateway.vm.synced_folder "./shared_folder/vm_cfg", "/vagrant_shared"

    gateway.vm.provision "shell", path: "shared_folder/vm_cfg/cfg_vm1.sh"

    gateway.vm.hostname = "gw"
  end
      
# VM 2 Servidor Web
  config.vm.box = "ubuntu/focal64"
      
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
    
  config.vm.define "servidor-web-vm" do |web|
    
    web.vm.network "private_network", ip: "192.168.56.15"
  
    web.vm.synced_folder "./shared_folder", "/var/www/html"

    web.vm.synced_folder "./shared_folder/vm_cfg", "/vagrant_shared"
  
    web.vm.network "forwarded_port", guest: 81, host: 8080

    web.vm.provision "shell", path: "shared_folder/vm_cfg/cfg_vm2.sh"

    web.vm.hostname = "servidor-web"
  end

# VM 3 Servidor BD
  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
    
  config.vm.define "servidor-bd-vm" do |banco|

    banco.vm.network "private_network", ip: "192.168.56.16"
    
    banco.vm.synced_folder "./shared_folder/vm_cfg", "/vagrant_shared"
  
    banco.vm.network "forwarded_port", guest: 81, host: 8081

    banco.vm.provision "shell", path: "shared_folder/vm_cfg/cfg_vm3.sh"

    banco.vm.hostname = "servidor-BD"
  end
end
