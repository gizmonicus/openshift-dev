Vagrant.configure("2") do |config|
    
    # Check for pre-requisite plugins
    unless Vagrant.has_plugin?("landrush")
      raise 'You must "vagrant plugin install landrush" first.'
    end

    # This allows internal DNS resolution between hosts
    config.landrush.enabled = true

    config.vm.define "node" do |node|
        node.vm.network "private_network", type: "dhcp"
        node.vm.box = "centos/7"
        node.vm.hostname = "node.vagrant.test"
    end

    config.vm.define "proxy" do |proxy|
        proxy.vm.network "private_network", type: "dhcp"
        config.vm.network "forwarded_port", guest: 80, host: 8080,
            auto_correct: true
        config.vm.network "forwarded_port", guest: 443, host: 8443,
            auto_correct: true
        proxy.vm.box = "centos/7"
        proxy.vm.hostname = "proxy.vagrant.test"
    end

    config.vm.define "master" do |master|
        master.vm.network "private_network", type: "dhcp"
        config.vm.network "forwarded_port", guest: 8443, host: 3448,
            auto_correct: true
        master.vm.box = "centos/7"
        master.vm.hostname = "master.vagrant.test"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/playbook.yml"
        ansible.raw_arguments = ENV['ANSIBLE_ARGS']
    end
end

# vim: set syntax=ruby:
