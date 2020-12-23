prepare:
	./scripts/pre-requisites.sh

setup:
	echo "Running Ansible"
	# python3 -m poetry run ansible-galaxy install -r requirements.yml
	python3 -m poetry run ansible-playbook setup.yml -i inventory --ask-become-pass

