# openshift-dev
Development Openshift environment

# Pre-requisites
* You will need a recent version of Ansible installed on your host machine for provisioning the servers. >2.1.0.0 would suffice.
* DNS is provided by the landrush plugin. To resolve DNS from your host, you will need the dnsmasq package installed. This is optional.
* This has been tested with Vagrant 1.9.1

# Bootstrapping
Run the bootstrap.sh script to bootstrap the Openshift cluster. This will set up all the cluster hosts in such a way that the ansible installer scripts will work. You will need to run that script manually from the master. I've done it this way so you can test upgrade playbooks, install and test new versions, etc. Additionally, before running the ansible installer, you should copy the example hosts file from /home/vagrant/ansible-hosts.example to /etc/ansible/hosts.
