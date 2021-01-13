# Mac Configuration

This project uses Ansible to configure my mac. I'm a total newbie to Ansible, so I welcome all feedback. I'm doing this to capture the nuances of my setup so I don't have to manually setup each laptop I run.

NB: There are NO tests yet. Use at your own risk.

# Running Ansible

I have added a `Makefile` that handles some of the bootstrapping and makes it easy to run on a clean Mac.
-  `make prepare` - this installs the pre-requisite steps:
   -  Installs Xcode essentials (`xcode-select --install`)
   -  Installs pipx (a Python package manager that installs executables for python packages in an isolated fashion)
   -  Installs Poetry (Python package and virtual environment manager via pipx)
   -  Installs Ansible and its dependencies
-  `make setup` runs Ansible.

# Features
The following gives an idea of what the playbook does. The playbooks use the variables in `default.config.yml`.
-  System
   -  Installs zipped fonts (Fira Code)
   -  Installs a list of Homebrew apps
   -  Installs a list of Homebrew cask apps
   -  Checks out repositories
   -  Installs dotfiles from a given repository

## Python Development

To facilitate Python development, the `make prepare` installs `pipx`. `pipx` allows us to install Python packages that have executables in an isolated fashion. It creates virtual environments for each of these packages. I use `pipx` to install `poetry` for instance. Then we use `poetry` to install the dependencies for Ansible.


# TODO
-  Use `homebrew` [package](https://galaxy.ansible.com/geerlingguy/homebrew) for brew and cask apps when [this issue](https://github.com/geerlingguy/mac-dev-playbook/issues/87) is resolved.
-  NVM Installation
-  Add a `make teardown` command to remove all the configurations that have been added.
-  Change shell to ZSH
-  Development
   - Generate SSH key
-  Mac Preferences
   - Monitor mirror
   - Scaled more space
   - Default browser (Firefox)
   - Keyboard repeat speed
   -  Mac Shortcuts
      -  Cmd + 1/2 - change screen
      -  4th mouse button (mission control)
      - Ctrl-p and ctrl-n
-  Replace `roles` in the `setup.yml` playbook with the `include_role` [directive](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/include_role_module.html)
-  Configure lazygit with my command overrides (~/Library/Application Support/lazygit/config.yml)
-  Add /usr/local/code-shell script
-  Add `add-icon` script that adds an icon to ~/.tmux-icons
-  https://github.com/yardnsm/tmux-1password

# Known Issues
-  This only works on Homebrew 2.7.0 and above. Brew recently changed the syntax for installing Cask apps, which resulted in this [issue](https://github.com/ansible-collections/community.general/issues/1524).
-  I need to find a better way to install Ansible properly. Previously I was using Poetry via pipx. The problem with this is that pipx installs Poetry alongside whatever of Python is installed. This problem manifests when you try to run Poetry in any project that requires a different version of Python. Poetry wants to be installed under a Python version that matches what's in pyproject.toml.
   -  Temporary fix is to install Poetry under each version of Python we install with pyenv. We can install Poetry by doing `pyenv install x.y.z && pyenv exec pip3 install poetry`. Then we can run `pyenv exec poetry install` to use poetry under pyenv's local version of Python.

# Inspiration

-  [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
-  [ansible-role-osx-defaults](https://github.com/lafarer/ansible-role-osx-defaults)
-  [ansible-mac](https://github.com/baopham/ansible-mac)