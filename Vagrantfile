Vagrant.configure("2") do |config|
    unless Vagrant.has_plugin?("vagrant-dns")
      raise 'You must "vagrant install vagrant-dns" first.'
    end

    config.vm.define "master" do |master|
        config.dns.tld = "dev"
        master.vm.network "private_network", type: "dhcp"
        master.vm.box = "centos/7"
        master.vm.hostname = "master"
    end

    (1..3).each do |i|
        config.vm.define "node#{i}" do |node|
            config.dns.tld = "dev"
            node.vm.network "private_network", type: "dhcp"
            node.vm.box = "centos/7"
            node.vm.hostname = "node#{i}"
        end
    end

    (1..2).each do |i|
        config.vm.define "proxy#{i}" do |proxy|
            config.dns.tld = "dev"
            proxy.vm.network "private_network", type: "dhcp"
            proxy.vm.box = "centos/7"
            proxy.vm.hostname = "proxy#{i}"
        end
    end
end

# vim: set syntax=ruby:
