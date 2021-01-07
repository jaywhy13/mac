echo "🍏 Installing Xcode bare essentials"
xcode-select --install || true
# Maybe we need this? See https://github.com/nodejs/node-gyp/issues/569
# sudo xcode-select --switch /Library/Developer/CommandLineTools
echo

echo "🐍 Installing Pipx"
brew install pipx
echo


echo "🐍 Installing Poetry via pipx"
pipx install poetry
echo

echo "🐍 Installing Ansible via Poetry"
poetry install
echo

