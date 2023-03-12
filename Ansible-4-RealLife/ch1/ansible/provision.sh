#/bin/sh


### Installing Python pip3
curl https://bootstrap.pypa.io/pip/3.6/get-pip.py -o get-pip.py
python3 get-pip.py 

###Installing Ansible version 2.9.5
python3 -m pip3 install  ansible==2.9.5


## add ansible
useradd -m -s /bin/bash -U ansible -u 666 --groups wheel
cp -pr /home/vagrant/.ssh /home/ansible/
chown -R ansible:ansible /home/ansible
echo "%ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible

yum update
yum upgrade
