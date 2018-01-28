#!/usr/bin/env bash

ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m ping all
ansible -m setup -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory all
# | sed -E "s/$HOST \| SUCCESS =>//" > "$HOST.json"
