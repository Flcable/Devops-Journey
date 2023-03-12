#/bin/sh

## add devops
useradd -m -s /bin/bash -U devops -u 666 --groups wheel
cp -pr /home/vagrant/.ssh /home/devops/
chown -R devops:devops /home/devops
echo "%devops ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/devops