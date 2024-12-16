# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Configuración general para todas las máquinas

    config.vm.box = "debian/bullseye64"

   # Capa 3: Base de datos
   config.vm.define "kilian_datos" do |datos|
    datos.vm.hostname = "kilian-datos"
    datos.vm.network "private_network", ip: "192.168.57.14", virtualbox_intnet: "red_capa3"
    datos.vm.network "private_network", ip: "192.168.56.14", virtualbox_intnet: "red_capa2"
    datos.vm.provision "shell", path: "prov_Datos.sh"
  end
  
    # Capa 2: Servidores web

    config.vm.define "kilian_NFS" do |nfs|
      nfs.vm.hostname = "kilian-nfs"
      nfs.vm.network "private_network", ip: "192.168.56.13", virtualbox_intnet: "red_capa2"
      nfs.vm.provision "shell", path: "prov_NFS.sh"
    end
    config.vm.define "kilian_WEB1" do |web1|
      web1.vm.hostname = "kilian-web1"
      web1.vm.network "private_network", ip: "192.168.56.11", virtualbox_intnet: "red_capa2"
      web1.vm.provision "shell", path: "prov_BackEnd.sh"
    end
  
    config.vm.define "kilian_WEB2" do |web2|
      web2.vm.hostname = "kilian-web2"
      web2.vm.network "private_network", ip: "192.168.56.12", virtualbox_intnet: "red_capa2"
      web2.vm.provision "shell", path: "prov_BackEnd.sh"
    end
  
  # Capa 1: Balanceador de carga
  config.vm.define "kilian_Balanceador" do |balanceador|
    balanceador.vm.hostname = "kilian-balanceador"
    balanceador.vm.network "public_network"
    balanceador.vm.network "private_network", ip: "192.168.56.10", virtualbox_intnet: "red_capa2"
    balanceador.vm.provision "shell", path: "prov_balanceador.sh"
  end
end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessible to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
