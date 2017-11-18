# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
servers = YAML.load_file(File.join(File.dirname(__FILE__), 'servers.yml'))

Vagrant.configure(2) do |config|
  config.vm.box = 'hashicorp/precise64'

  servers.each do |server|
    config.vm.define server['name'] do |machine|
      machine.vm.hostname = server['name']
      machine.vm.network 'private_network', ip: server['private_ip']
    end
  end

  config.vm.provision 'ansible' do |ansible|
    ansible.compatibiliy_mode = '2.0'
    ansible.playbook = 'site.yml'
    ansible.groups = {
      'webservers' => ['docker-01', 'docker-02', 'docker-03'],
      'webservers:vars' => { 'protected_storage' => '.' }
    }
  end
end
