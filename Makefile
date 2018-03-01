ARGS:=
vagrant-up:
	vagrant up --provider=virtualbox ${ARGS}

vagrant-check:
	ansible-playbook site.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --check

vagrant:
	ansible-playbook site.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

vagrant-ping:
	ansible -m ping -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory all

provision:
	ansible-playbook site.yml -i inventories/production/hosts ${ARGS}

dry-run:
	ansible-playbook site.yml --check -i inventories/production/hosts ${ARGS}

check-syntax:
	ansible-playbook site.yml --syntax-check

install:
	pip install ansible
	ansible-galaxy install -r requirements.yml
	./scripts/configure_secrets
