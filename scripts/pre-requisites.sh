command_exists() {
    [ -x "$(command -v $1)" ]
}


if command_exists "xcode-select"; then
    echo "🍏 Installing Xcode bare essentials"
    xcode-select --install || true
    # Maybe we need this? See https://github.com/nodejs/node-gyp/issues/569
    # sudo xcode-select --switch /Library/Developer/CommandLineTools
    echo
fi

if command_exists "brew"; then
    # This handles installations on a Mac
    echo "🐍 Installing Pipx"
    brew install pipx
    echo
else
    # This handles Linux-based installations
    echo "🐍 Installing Pipx (using pip)"
    sudo apt-get update --fix-missing
    # Also install ohai -- this is a library used by Ansible to collect system facts
    sudo apt install -y python3-venv python3-pip ohai
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    echo
fi


echo "🐍 Installing Poetry via pipx"
# I had to fix Poetry using the suggestion here:
# In effect, the file contained some carriage return statements.
# Vi has a nice feature of fixing this, by doing :set ff=unix then
# saving the file.
# https://stackoverflow.com/questions/19425857/env-python-r-no-such-file-or-directory
pipx install poetry
echo

echo "🐍 Installing Ansible via Poetry"
poetry install
echo

