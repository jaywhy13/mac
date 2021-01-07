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

# TODO
-  Use `homebrew` [package](https://galaxy.ansible.com/geerlingguy/homebrew) for brew and cask apps when [this issue](https://github.com/geerlingguy/mac-dev-playbook/issues/87) is resolved.
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

# Known Issues
-  This only works on Homebrew 2.7.0 and above. Brew recently changed the syntax for installing Cask apps, which resulted in this [issue](https://github.com/ansible-collections/community.general/issues/1524).


# Inspiration

-  [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
-  [ansible-role-osx-defaults](https://github.com/lafarer/ansible-role-osx-defaults)
-  [ansible-mac](https://github.com/baopham/ansible-mac)