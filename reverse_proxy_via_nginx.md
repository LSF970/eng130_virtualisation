# How to use Nginx to make a reverse proxy

////

# Reverse Proxy allows us make it so the client does not need to specifiy the port number when accessing a resource.

# cd into nginx deafult settings
- `sudo nano /etc/nginx/sites-available/default`
- add the following lines of code to the location block so it looks like this:
- `location / {`
- `proxy_pass http://192.168.10.100:3000;` 
- `proxy_http_version 1.1;`
- `proxy_set_header Upgrade $http_upgrade;`
- `proxy_set_header Connection 'upgrade';`
- `proxy_set_header Host $host;`
- `proxy_cache_bypass $http_upgrade;`
- `}`

- Save and exit
- The main line to add is the first one, it changes the default location to 192.168.10.100:3000 so it will display as 192.168.10.100

# Checking this worked
- `sudo nginx -t` checks syntax of default file
- `sudo systemctl restart nginx` restarts nginx with new settings
- Check 192.168.10.100 in your browser