# RUN THESE COMMANDS ON YOUR LOCAL WORKSTATION
    # Start the virtual machine and log in
    vagrant up
    vagrant ssh

# Nginx, PHP, amd MariaDB are installed and configured for you in this lesson.
# Proceed with the following steps to complete the configuration.

# RUN THESE COMMANDS ON THE VIRTUAL MACHINE
    sudo su -

# Make and customize the 403 page:

	cp /var/www/wisdompetmed.local/404.html /var/www/wisdompetmed.local/403.html
	vim /var/www/wisdompetmed.local/403.html

# Modify the 403 page to use the correct wording for a 403 error.  Something like "We can't show you this" instead of "We can't find it."

# Edit /etc/nginx/conf.d/wisdompetmed.local.conf so that is has the
# following contents and then save the file:

    server {
        listen 80 default_server;

        root /var/www/wisdompetmed.local;

        server_name wisdompetmed.local www.wisdompetmed.local;

        index index.html index.htm index.php;

        access_log /var/log/nginx/wisdompetmed.local.access.log;
        error_log /var/log/nginx/wisdompetmed.local.error.log;

        location / {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            try_files $uri $uri/ =404;
        }

        location /appointments/ {
            # only allow IPs from the same network the server is on
            allow 192.168.0.0/24;
            allow 10.0.0.0/8;
            deny all;
        }

        location /deny {
            deny all;
        }

        location /images/ {
            # Allow the contents of the /image folder to be listed
            autoindex on;
            access_log /var/log/nginx/wisdompetmed.local.images.access.log;
            error_log /var/log/nginx/wisdompetmed.local.images.error.log;
        }

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
            fastcgi_intercept_errors on;
        }

        error_page 403 /403.html;
        location = /403.html {
            internal;
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

# Test and reload the configuration
    nginx -t
    systemctl reload nginx

# Load the deny page in a browser: http://192.168.0.3/deny
