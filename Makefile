prepare:
	./scripts/pre-requisites.sh

setup:
	echo "Running Ansible"
	poetry run ansible-galaxy install -r requirements.yml
	poetry run ansible-playbook setup.yml -i inventory --ask-become-pass

