#/bin/sh

yum install httpd wget unzip -y
systemctl start httpd
systemctl enable httpd
cd /tmp/
wget https://www.tooplate.com/zip-templates/2121_wave_cafe.zip
unzip -o 2121_wave_cafe.zip
cp -r 2121_wave_cafe/* /var/www/html/
systemctl restart httpd