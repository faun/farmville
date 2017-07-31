ARGS:=
up:
	vagrant up --provider=vmware_fusion ${ARGS}

provision:
	ansible-playbook site.yml -i inventories/production/hosts ${ARGS}

dry-run:
	ansible-playbook site.yml --check -i inventories/production/hosts ${ARGS}

check-syntax:
	ansible-playbook site.yml --syntax-check

install:
	brew install ansible
	ansible-galaxy install dev-sec.os-hardening
	ansible-galaxy install dev-sec.ssh-hardening
	ansible-galaxy install jdauphant.nginx
	ansible-galaxy install dev-sec.nginx-hardening
