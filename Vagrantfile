# Create a virual machine (VM) using Vagrant
# VirtualBox
# Vagrant
# Ruby dev-kit

# Test the installation
# ruby --version
# vagrant --version

# Creating a VM with Linux os using ubuntu 16.04LTS

# Configure the VM with Ruby
Vagrant.configure("2") do |config|
    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/bionic64"
        # creating a virtual machine ubuntu 
        app.vm.network "private_network", ip:"192.168.10.100"
    
        # app.hostsupdater.aliases = ["development.local"]
        # first path is where to pull from, second is where to put/create folder in VM
        app.vm.synced_folder ".", "/home/vagrant/app"
        app.vm.synced_folder ".", "/home/vagrant/environment"

         # To install all dependencies on startup
         app.vm.provision "shell", path: "provision.sh"

    end

    config.vm.define "db" do |db|
        db.vm.box = "ubuntu/bionic64"
        db.vm.network "private_network", ip:"192.168.10.150"

    end

    # add file to root of VM
    config.vm.provision "file", source: "~/eng130_virtualisationV2/provision.sh", destination: "./provision.sh"
    config.vm.provision "shell", path: "provision.sh"



end
# Exit your VM
# Run vagrant reload from localhost - from same location as Vagrantfile
# Run `vagrant destroy`` then `vagrant up`` if reload doesnt work
# vagrant ssh
# sudo apt-get install nginx -y
# enter ip address into web browser, you should see an nginx welcome page
