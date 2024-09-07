# this script does the following:
# - copies config files into the proper places
# - installs relevant software for those config files
# - sets some other config values

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

# install neovim from release binaries
echo -n "Downloading nvim..."
curl -s -LO https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
echo " done!"
echo -n "Installing nvim..."
sudo rm -rf /opt/neovim
sudo mv nvim-linux64 /opt/neovim
echo 'export PATH=$PATH:/opt/neovim/bin' >> ~/.bashrc
echo " done!"

# copy nvim init files
echo -n "Copying init.lua..."
cp init.lua ~/.config/nvim
echo " done!"

echo -n "Downloading verible..."
curl -s -LO https://github.com/chipsalliance/verible/releases/download/v0.0-3756-gda9a0f8c/verible-v0.0-3756-gda9a0f8c-linux-static-x86_64.tar.gz
tar -xzf verible-v0.0-3756-gda9a0f8c-linux-static-x86_64.tar.gz
echo " done!"
echo -n "Installing verible..."
sudo rm -rf /opt/verible
sudo mv verible-v0.0-3756-gda9a0f8c /opt/verible
echo 'export PATH=$PATH:/opt/verible/bin' >> ~/.bashrc

echo " done!"

echo "Setup complete!"
