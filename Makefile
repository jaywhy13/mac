setup:
	@echo "🍏 Installing Xcode bare essentials"
	xcode-select --install || true
	echo

	@echo "🐍 Installing Ansible via Poetry"
	poetry install

	@echo "Running Ansible"
	poetry run ansible-playbook setup.yml -i inventory --ask-become-pass
