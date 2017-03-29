#!/bin/bash
cat /vagrant/sshkeys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo yum -y install epel-release
sudo yum -y install ansible git vim pyOpenSSL
sudo cp /vagrant/ansible-hosts /etc/ansible/hosts
git clone https://github.com/openshift/openshift-ansible.git
