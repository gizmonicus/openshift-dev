#!/bin/bash
cat /vagrant/sshkeys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
yum -y install epel-release
yum -y install ansible-2.2.0.0 git vim pyOpenSSL
cp /vagrant/ansible-hosts /etc/ansible/hosts
cp /vagrant/sshkeys/id_rsa /home/vagrant/.ssh/id_rsa
git clone https://github.com/openshift/openshift-ansible.git
chown -R vagrant:vagrant /home/vagrant
