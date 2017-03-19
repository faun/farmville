ARGS:=
up:
	vagrant up --provider=vmware_fusion ${ARGS}

provision:
	ansible-playbook site.yml --ask-vault-pass -i inventories/production/hosts ${ARGS}

dry-run:
	ansible-playbook site.yml --ask-vault-pass --check -i inventories/production/hosts ${ARGS}

check-syntax:
	ansible-playbook site.yml --ask-vault-pass --syntax-check

install:
	brew install ansible
	ansible-galaxy install dev-sec.os-hardening
	ansible-galaxy install dev-sec.ssh-hardening
	ansible-galaxy install dev-sec.nginx-hardening
