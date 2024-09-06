# this script does the following:
# - copies config files into the proper places
# - installs relevant software for those config files
# - sets some other config values

# copy .vimrc, use preinstalled vim
cp .vimrc ~/.vimrc

# install neovim from source
sudo rm -rf neovim
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.10.1
sudo apt install ninja-build gettext cmake unzip curl build-essential
make CMAKE_BUILD_TYPE=Release
sudo make install

# copy nvim init files
cp init.lua ~/.config/nvim

git config --global user.name "Kailas B. Kahler"
git config --global core.editor nvim
git config --global commit.verbose true
git config --global alias.lol "log --graph --oneline --decorate --color --all"
