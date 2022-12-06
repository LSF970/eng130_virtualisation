# How to set up VM's with Vagrant, VirtualBox and Ruby

////

# Virtualisation

## Dev Env

### Vagrant

- Check internet connectivity `sudo apt-get update`
- Run upgrade `sudo apt-get upgrade -y`
- Where am I? `pwd` gives you your current location
- Who am I? `uname` or `uname -a` or `whoami`
- How to create a file in Linux `touch filename` or `nano filename`
- How to check files/folders available in current location `ls` or to check for hidden files `ls -a`
- How to create a folder `mkdir folder_name`
-  How to navigate to the folder ` cd folder_name`
- How to navigate back out `cd ..` or `cd` Enter
- How to delete a file/folder `rm -rf file/folder_name`
- How to copy file from location to another `cp test_file.txt test_folder/`
- How to navigate between OS and VM `exit` Enter
- For admin access `sudo`, switch to admin user `sudo su`, use `exit` to go back to normal user
- Show the permissions of the files/folders in the directory `ls -l`, Show hidden too `ll`
- Change permissions `chmod instruction file_name` i.e. `chmod 700 test.txt` can use letters as well as numbers for permissions. I prefer numbers
- Current running processes `top` (task mananger in Linux basically) & `ps aux`
- Ctrl + C to cancel out of it and return to shell
- To remove any process `kill PID` PID = processid - e.g. kill 7
- To delete folder/hidden folder `ls -a`

# TASKS
- Print last 3 lines from text.txt: `tail -3 text.txt`
- Print first 3 lines from text.txt: `head -3 text.txt`
- Print last 10 lines from text.txt: `tail -10 text.txt`


- `grep` used to print speccific lines where a string is found and highlight said string in that line - e.g. grep "the" text.txt
- `|` This is called "Piping", which is the process of redirecting the output of one command to the input of another command. Very useful and common in Linux/Unix-like systems. e.g. `cat /etc/profile | grep bash`
- `sort` SORT command sorts the contents of a text file, line by line. e.g. `sort text.txt`
- `ps aux` shortlist by name. This allows you to kill a program using it's name rather than finding it's PID. e.g. `ps aux | grep -i firefox`
- How to create/run a process in the background & foreground, create/run a process in both areas `bg` for background, `fg` for foreground
- Use ` sudo pkill process_name` to kill background processes by name

# Install `nginx` in the VM

- Install `nginx` in VM (`sudo apt-get install nginx-y`)
- Create a `private-network` between localhost and vm
- Allocate an IP address
- How to check a tool/software status in Linux `sudo systemctl status nginx`
- How to restart a process in Linux `sudo systemctl restart nginx`
 








# Vagrant commands cheatsheet

Usage: vagrant [options] <command> [<args>]

    -h, --help                       Print this help.

Common commands:
     autocomplete    manages autocomplete installation on host
     box             manages boxes: installation, removal, etc.
     cloud           manages everything related to Vagrant Cloud
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     init            initializes a new Vagrant environment by creating a Vagrantfile
     login
     package         packages a running vagrant environment into a box
     plugin          manages plugins: install, uninstall, update, etc.
     port            displays information about guest port mappings
     powershell      connects to machine via powershell remoting
     provision       provisions the vagrant machine
     push            deploys code in this environment to a configured destination
     rdp             connects to machine via RDP
     reload          restarts vagrant machine, loads new Vagrantfile configuration
     resume          resume a suspended vagrant machine
     serve           start Vagrant server
     snapshot        manages snapshots: saving, restoring, etc.
     ssh             connects to machine via SSH
     ssh-config      outputs OpenSSH valid configuration to connect to the machine
     status          outputs status of the vagrant machine
     suspend         suspends the machine
     up              starts and provisions the vagrant environment
     upload          upload to machine via communicator
     validate        validates the Vagrantfile
     version         prints current and latest Vagrant version
     winrm           executes commands on a machine via WinRM
     winrm-config    outputs WinRM configuration to connect to the machine

For help on any individual command run `vagrant COMMAND -h`

Additional subcommands are available, but are either more advanced
or not commonly used. To see all subcommands, run the command
`vagrant list-commands`.
        --[no-]color                 Enable or disable color output
        --machine-readable           Enable machine readable output
    -v, --version                    Display Vagrant version
        --debug                      Enable debug output
        --timestamp                  Enable timestamps on log output
        --debug-timestamp            Enable debug output with timestamps
        --no-tty                     Enable non-interactive output# Steps for VM creation 


## Configuring the environment for deployment
 - unzip folders of app into folder with Vagrantfile
 - Sync these folders using the line:
 - `config.vm.synced_folder ".", "/home/vagrant/app"` this will sync the entire folder into the second path specified (on the VM)
 - vagrant reload (Or vagrant destroy -> vagrant up)
 - ssh in with vagrant ssh and type ls
 - The synced folder(s) should be there, highlighted to show they are synced

 - Now we need to install Ruby dependencies on localhost in order to run the environment checks for the app being deployed
 - Navigate to the folder with the test code inside (e.g.`/c/Users/Luke/eng130_virtualisationV2/environment/spec-tests` ) usind cd
 - run `gem install bundler` while in the correct folder, this will install bundler
 - run `bundle`
 - Tests should be runable now
 - To run the tests run `rake spec`
 - This will show what dependencies the app needs, if we dont have them we will get a fail

 ## Configure the VM environment to have required dependencies
 NGINX
 - Install nginx `sudo apt-get install nginx -y`
 - Check it is running `sudo systemctl status nginx`
 - Enable it so the app can use it `sudo systemctl enable nginx`
 - go back to your localhost terminal and run the tests again (`rake spec`)
 - 3 tests should now pass

 ## NOT FINSISHED YET


## Run vagrant app in the background
- `nohup node app.js /dev/null 2>&1 &`
## Automate reverse proxy
- remove the default ``sudo rm etc/nginx/sites-available/default`
- replace it with your own file `sudo cp existing-location / etc/nginx/sites-available/default`
- restart nginx `sudo systemctl restart nginx` 
- enable nginx `sudo systemctl enable nginx` 
- checck if valid `sudo nginx -t`
- access nginx logs `/var/log/nginx`

### Linux Env Var
- syntax NAME = LUKE
- How to check existing env var `env`
- `export` to create new env var (e.g. `export MY_VAR=LUKE`)

# Setting up 2 Separate Virtual Machine `app` & `db` and connecting them.

### Pre-requisite: 
- app folder - It contains the working app with all the files and its dependencies in `package.json` file.
- environment folder - It contains the test files for the environment.
- If any previous instance of **Virtual Machine** is running, destroy it using `vagrant destroy`.

**Step 1**: Modify the exiting `Vagrant File`, to create 2 different virtual machine `app` and `db`.

```
# Vagrant Configuration Script
Vagrant.configure("2") do |config|
    # Configuration Script for app
    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/bionic64"
        app.vm.network "private_network", ip: "192.168.10.100"
        app.vm.synced_folder "./app", "/home/vagrant/app", create: true
        app.vm.synced_folder "./environment", "/home/vagrant/environment", create: true
        app.vm.provision "shell", path: "provision.sh", privileged: false
    end

    # Configure Script for database
    config.vm.define "db" do |db|
        db.vm.box = "ubuntu/bionic64"
        db.vm.network "private_network", ip: "192.168.10.150"
    end
end
```
- Make sure the indentation format is properly followed.
- The location of the file should be correctly identified.

**Note**: If using `Mac OS`, the `ip address` will be different.

**Step 2**: In the `provision.sh` file, update the `node.js` link to `12.x` from `6.x` used previously.

```
# Latest Version, Used when running two VM: app and database
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```
- Rest of the `provision.sh` file is similar to the one previously Used.


**Step 3**: Create both the Virtual Machine, using `vagrant up` command. If only one VM shows, do it individually for the one not up and running `vagrant up db`.

- Check both of the Virtual Machine are running properly using `vagrant status`.

```
$ vagrant status
Current machine states:

app                       running (virtualbox)
db                        running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

## Checking the `app` Virtual Machine

**Step 4**: Login to the app VM, `vagrant ssh app`. Navigate to the `app.js` location and run the app by typing `npm start`.

**Note**: If we get error like, `npm is not a recognized command` or similar, it means `provision.sh` file didn't worked properly. Manual Installation is required.

```
Manually install the files that's mentioned in the `provision.sh` file.

# update system
sudo apt-get update -y

# upgrade system
sudo apt-get upgrade -y

# install web-server called Nginx
sudo apt-get install nginx -y

# restart nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Install python
sudo apt-get install python -y
sudo apt-get install python-software-properties

# Install node.js
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# Install Process Manager

sudo npm install pm2 -g
```

- After `npm start` is run we get a message `Your app is ready and listening on port 3000`.
- To make sure it's working we can check the `ip:port` in the browser.


  <img src="https://user-images.githubusercontent.com/110366380/197001278-f5cb993f-e93e-48b3-920c-511c4c386d0b.png">



## Setting up the `db` Virtual Machine

**Step 5**: In a new terminal, sign in to the `database Virtual Machine` using `vagrant ssh db`.

**Step 6**: Once inside the `db` Virtual Machine, install the database, following the commands:

```
# Add the Key:

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927  # A confirmation of import will be displayed

# Make Sure its Working
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# It will display back - deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse

# Update and Upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install database - sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
```

**Step 7**: After installation is complete, check the status of the database.

```
sudo systemctl status mongod

# It might show Active: inactive (dead)1  # First time of running
```

- Now Follow the following step by step:
```
sudo systemctl start mongod
sudo systemctl status mongod
sudo systemctl enable mongod

# If successfully enabled, we will receive the following message in the console.
Created symlink /etc/systemd/system/multi-user.target.wants/mongod.service -> /lib/systemd/system/mongod.service.
```

## Changing the configuration

**Step 8**: Change the `mongod.conf` file. It's inside the `etc` folder.

```
sudo nano /etc/mongod.conf
```

- change the network interfaces
```
# network interfaces
net:
 port: 27017
 bindIp: 127.0.0.1 
 
# Change it to 0.0.0.0 which means allow access to everyone.

# network interfaces
net:
 port: 27017
 bindIp: 0.0.0.0 
```

 - Use cat to check if its changed to `0.0.0.0`. `$ cat nano etc/mongod.conf` 
 
**Step 9**: Restart mongo db.
```
sudo systemctl restart mongod
sudo systemctl enable mongod
```

## Setting up the environment variable

**Step 10**: We need to set up the environment variable so that the app can connect to the database. In the app VM, navigate to the app.js location

- If the app is running, stop it using `CTRL + Z`
- Create an environment variable called `DB_HOST=mongodb://192.168.10.150:27017/posts`
```
$export DB_HOST=mongodb://192.168.10.150:27017/posts
```
- We can persist the environment variable in `.bashrc` file if needed.
- To check, if it is set up properly use `printenv DB_HOST`

```
vagrant@ubuntu-bionic:~/app$ printenv DB_HOST
mongodb://192.168.10.150:27017/posts
```

## Checking the Connection between app and database

- Run `npm start`
- Restart the app and open a browser, enter the following URL: `http://192.168.10.100:3000/posts`


    <img src="https://user-images.githubusercontent.com/110366380/196987908-daef1908-476b-46f0-9dad-b03ae2fd57c6.png">


- If we see this page, that means the `database` is successfully connected to the `app`. We can't see the content yet. To get the contents:
- Stop the currently running App, and type `node seeds/seed.js` on the same terminal (same location where `app.js` file is located).
```
# We should be able to see these message if it works.   
Database Cleared
Database Seeded
```
- Run `npm start`.
- We should now see the content of the database if we refresh the browser with the following url: `http://192.168.10.100:3000/posts`
    

    <img src="https://user-images.githubusercontent.com/110366380/197177133-76732e49-6003-4359-8411-21b7141a55b7.png"


### Potential Blocker:
- Since we are stopping and restarting the app many times, we might still have the process running in the background.
- It won't allow us to run on `port: 3000` as it is already used.
- In such scenario, we have to list out all the running process using `ps aux`
- Kill the process, using `kill -9 PID`
    
**Note**: If reverse proxy is steup in `nginx`, we don't need to specify the port number `3000`.   
