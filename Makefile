ARGS:=
up:
	vagrant up --provider=vmware_fusion ${ARGS}

provision:
	ansible-playbook main.yml ${ARGS}

deploy:
	ansible-playbook main.yml -i inventory --limit production ${ARGS}

dry-run:
	ansible-playbook main.yml --check -i inventory --limit production ${ARGS}

check-syntax:
	ansible-playbook main.yml --syntax-check
