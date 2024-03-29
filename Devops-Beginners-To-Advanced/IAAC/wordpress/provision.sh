#/bin/sh

sudo apt update
sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip -y

sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

cp /vagrant/wordpress.conf /etc/apache2/sites-available/wordpress.conf

sudo a2ensite wordpress

sudo a2enmod rewrite

sudo a2dissite 000-default

sudo service apache2 reload

sudo mysql -u root -e 'CREATE DATABASE wordpress;'
sudo mysql -u root -e "CREATE USER wordpress@localhost IDENTIFIED BY 'Admin1234';"
sudo mysql -u root -e 'GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;'
sudo mysql -u root -e 'FLUSH PRIVILEGES;'

sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php

sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/Admin.1234/' /srv/www/wordpress/wp-config.php



