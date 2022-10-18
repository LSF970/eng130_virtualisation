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



