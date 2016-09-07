ARGS:=
up:
	vagrant up --provider=vmware_fusion ${ARGS}

provision:
	ansible-playbook main.yml ${ARGS}

pine:
	ansible-playbook main.yml -i /etc/ansible/hosts ${ARGS}

dry-run:
	ansible-playbook main.yml --check -i /etc/ansible/hosts

check-syntax:
	ansible-playbook main.yml --syntax-check
