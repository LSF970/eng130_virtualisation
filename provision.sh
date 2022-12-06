#!/bin/bash/

# update machine
sudo apt-get update -y

# upgrade machine
sudo apt-get upgrade -y

# # install nginx webserver
sudo apt-get install nginx -y

# # start nginx
sudo systemctl start nginx

# # enable nginx so it can be accessed by app
sudo systemctl enable nginx

# # Install Python
sudo apt-get install python -y

# # Install some python dependencies
sudo apt-get install python-software-properties

# # Get Nodejs 6.x
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# # Install nodejs
sudo apt-get install nodejs -y

# # npm is already installed, use it to install pm2 dependency
sudo npm install pm2 -g

# # cd into folder with app.js
cd app

cd app

# # Install npm in the folder s othe app can be run
sudo npm install