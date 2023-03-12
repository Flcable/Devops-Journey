#/bin/sh
sudo apt update && sudo apt upgrade


sudo apt -y remove ansible
sudo apt -y --purge autoremove

sudo apt -y update  && sudo apt -y upgrade

sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible

sudo apt -y install ansible

#sudo apt -y install python3-argcomplete
#sudo activate-global-python-argcomplete3 -y


## add ansible
useradd -m -s /bin/bash -U ansible -u 666 --groups root
cp -pr /home/vagrant/.ssh /home/ansible/
chown -R ansible:ansible /home/ansible
echo "%ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible

cat << EOT >> /etc/hosts
192.168.56.2 ansible.local.lab
192.168.56.3 node01.local.lab
EOT