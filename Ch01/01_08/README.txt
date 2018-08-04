# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx is installed and configured for you in this lesson.
# The demo site is also installed and partially configured.
# Proceed with the following steps to complete the configuration.

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -
    vim /etc/nginx/conf.d/wisdompetmed.local.conf

# Edit /etc/nginx/conf.d/wisdompetmed.local.conf so that is has the
# following contents and then save the file:

    server {
        listen 80 default_server;

        root /var/www/wisdompetmed.local;

        server_name wisdompetmed.local www.wisdompetmed.local;

        index index.html index.htm index.php;

        location / {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            try_files $uri $uri/ =404;
        }

        location /images/ {
            # Allow the contents of the /image folder to be listed
            autoindex on;
        }

        error_page 404 /404.html;
        location = /404.html {
            internal;
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
            internal;
        }

        location = /500 {
            fastcgi_pass unix:/this/will/fail;
        }
    }

# Now continue with the following commands
    nginx -t
    systemctl reload nginx

# Open the site in your browser: http://192.168.0.3

# Check the images location: http://192.168.0.3/images

# You should see the content of this directory.

# Check the custom 404 page: http://192.168.0.3/missing

# You should see the custom page with a cute little chicken.

# Check the custom 500 page: http://192.168.0.3/500

# You should see the custom 500 page with two cute little chickens.