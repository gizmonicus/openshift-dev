Vagrant.configure("2") do |config|
    unless Vagrant.has_plugin?("landrush")
      raise 'You must "vagrant plugin install landrush" first.'
    end

    # This allows internal DNS resolution between hosts
    config.landrush.enabled = true

    config.vm.define "node" do |node|
        node.vm.network "private_network", type: "dhcp"
        node.vm.box = "centos/7"
        node.vm.hostname = "node.vagrant.test"
        node.vm.provision "shell",
            inline: "cat /vagrant/sshkeys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
    end

    config.vm.define "proxy" do |proxy|
        proxy.vm.network "private_network", type: "dhcp"
        config.vm.network "forwarded_port", guest: 80, host: 8080
        config.vm.network "forwarded_port", guest: 443, host: 8443
        proxy.vm.box = "centos/7"
        proxy.vm.hostname = "proxy.vagrant.test"
        proxy.vm.provision "shell",
            inline: "cat /vagrant/sshkeys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
    end

    config.vm.define "master" do |master|
        master.vm.network "private_network", type: "dhcp"
        config.vm.network "forwarded_port", guest: 8443, host: 3448
        master.vm.box = "centos/7"
        master.vm.hostname = "master.vagrant.test"
        master.vm.provision "shell", path: "master-provision.sh"
    end

end

# vim: set syntax=ruby:
