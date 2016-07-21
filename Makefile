up:
	vagrant up --provider=vmware_fusion

provision:
	ansible-playbook main.yml

