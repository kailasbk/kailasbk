#!/bin/bash
# this script does the following:
# - adds missing locales
# - installs essential apt packages
# - copies config files into the proper places
# - installs relevant software for those config files
# - sets some other config values

echo -n "Adding en_US locale..."
sudo locale-gen en_US > /dev/null
sudo update-locale > /dev/null
echo " done!"

echo "Installing apt packages..."
sudo apt install -y \
    ripgrep \

echo -n "Setting .gitconfig..."
git config --global user.name "Kailas B. Kahler"
git config --global core.editor nvim
git config --global commit.verbose true
git config --global alias.lol "log --graph --oneline --decorate --color --all"
echo " done!"

# copy .vimrc, use preinstalled vim
echo -n "Copying .vimrc..."
cp .vimrc ~/.vimrc
echo " done!"

# download and install neovim release binaries
echo "Downloading nvim..."
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz

echo -n "Installing nvim..."
sudo rm -rf /opt/neovim
sudo mv nvim-linux64 /opt/neovim
if [ $(grep -c 'export PATH=$PATH:/opt/neovim/bin' ~/.bashrc) -eq 0 ]; then
    echo 'export PATH=$PATH:/opt/neovim/bin' >> ~/.bashrc
fi
echo " done!"

# copy nvim init files
echo -n "Copying init.lua..."
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
cp init.lua ~/.config/nvim
cp -r lua ~/.config/nvim
echo " done!"

# download and install verible
echo "Downloading verible..."
curl -LO https://github.com/chipsalliance/verible/releases/download/v0.0-3756-gda9a0f8c/verible-v0.0-3756-gda9a0f8c-linux-static-x86_64.tar.gz
tar -xzf verible-v0.0-3756-gda9a0f8c-linux-static-x86_64.tar.gz

echo -n "Installing verible..."
sudo rm -rf /opt/verible
sudo mv verible-v0.0-3756-gda9a0f8c /opt/verible
if [ $(grep -c 'export PATH=$PATH:/opt/verible/bin' ~/.bashrc) -eq 0 ]; then
    echo 'export PATH=$PATH:/opt/verible/bin' >> ~/.bashrc
fi
echo " done!"

echo "Setup complete!"
