# -*- mode: ruby -*-
# you're doing.
# vi: set ft=ruby :

require 'yaml'
vagrant_config = YAML.load_file('vagrant.yml')

Vagrant.configure("2") do |config|

environment = 'puppet'
config.vm.box_check_update = false
config.vm.hostname         = vagrant_config['hostname']
config.vm.box              = "geerlingguy/centos7"
 
  vagrant_config['nodes'].each do |node|
  
    config.vm.define node['name'] do |srv|
      srv.vm.hostname = node['hostname']

      srv.vm.network :private_network, ip: node['ip']
        node['ports'].each do |port|
        srv.vm.network :forwarded_port, guest: port['guest'], host: port['host'], auto_correct: true
      end

      srv.vm.provider :virtualbox do |vbx|
        vbx.name             = node['name']
        vbx.cpus             = node['cpus']
        vbx.memory           = node['memory']
      end

      node['synced_folders'].each do |folder|
        config.vm.synced_folder folder['src'], folder['dst']
      end
    end
    config.vm.provision "shell" do |prov|
      prov.path = node['provision']
    end
  end
end
