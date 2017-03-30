Vagrant.configure("2") do |config|
    
    # Check for pre-requisite plugins
    unless Vagrant.has_plugin?("landrush")
      raise 'You must "vagrant plugin install landrush" first.'
    end

    # This allows internal DNS resolution between hosts
    config.landrush.enabled = true

    # Increase memory for better performance, unless of course
    # you don't have free memory on the host :-)
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end

    config.vm.define "node" do |node|
        node.vm.network "private_network", ip: "172.28.128.20"
        node.vm.box = "centos/7"
        node.vm.hostname = "node.vagrant.test"
    end

    config.vm.define "proxy" do |proxy|
        proxy.vm.network "private_network", ip: "172.28.128.30"
        proxy.vm.box = "centos/7"
        proxy.vm.hostname = "proxy.vagrant.test"
    end

    config.vm.define "master" do |master|
        master.vm.network "private_network", ip: "172.28.128.10"
        master.vm.box = "centos/7"
        master.vm.hostname = "master.vagrant.test"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/playbook.yml"
        ansible.raw_arguments = ENV['ANSIBLE_ARGS']
    end
end

# vim: set syntax=ruby:
