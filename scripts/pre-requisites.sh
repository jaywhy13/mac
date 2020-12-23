echo "🍏 Installing Xcode bare essentials"
xcode-select --install || true
echo

echo "🐍 Installing Poetry"
pip3 install --user poetry
echo

echo "🐍 Installing Ansible via Poetry"
python3 -m poetry install
echo

