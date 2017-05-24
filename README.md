# openshift-dev
Development Openshift environment

# Pre-requisites
* You will need a recent version of Ansible installed on your host machine for provisioning the servers. >2.1.0.0 would suffice.
* DNS is provided by the landrush plugin. To resolve DNS from your host, you will need the dnsmasq package installed. This is optional.
* This has been tested with Vagrant 1.9.1

# Bootstrapping
Run the bootstrap.sh script to bootstrap the Openshift cluster. This will set up all the cluster hosts in such a way that the ansible installer scripts will work. You will need to run that script manually from the master. I've done it this way so you can test upgrade playbooks, install and test new versions, etc.

# Initial installation
When you run vagrant up (or use the bootstrap.sh script), you will get three clean VMs with all the pre-requisites installed; Openshift is not installed by default. This means you get to install it yourself (yay!). Do the following to get Openshift installed:

```
# ssh to the master
vagrant ssh master

# Change into the openshift-ansible repo dir and select the right release.
cd ~/openshift-ansible && git checkout release-1.2

# Run the byo playbooks, in this case using the 1.2.0_4 example hosts file.
# You are free to create your own hosts file.
ansible-playbook playbooks/byo/openshift-cluster/config.yml -i ../ansible_hosts/base_1.2.0_4.hosts
```
Note that it may take more than one run to fully install the cluster components. While not ideal, this is pretty normal. If you run into an error regarding creating the router because the resource already exists, using `oc`, delete the router DC and SVC and run the installer again.

# Changing the versionlock configuration
If you want to experiment with different versionlock configurations, you can do so by changing the versionlock.list file that is deployed to each of the nodes. This does mean that you will need to run the ansible playbook manually. The versionlock.list files can be found in `provisioning/files/versionlock/`

```
cd provisioning
ansible-playbook -i ../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -e versionlock_file=base.list playbook.yml
```
