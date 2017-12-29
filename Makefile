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
	brew install ansible || brew upgrade ansible
	ansible-galaxy install ${ARGS} dev-sec.nginx-hardening
	ansible-galaxy install ${ARGS} dev-sec.os-hardening
	ansible-galaxy install ${ARGS} dev-sec.ssh-hardening
	ansible-galaxy install ${ARGS} jdauphant.nginx
	ansible-galaxy install ${ARGS} tersmitten.locales
	./scripts/configure_secrets
