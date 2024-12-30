all: apt git nvim

apt:
	@echo "Installing apt packages..."
	@sudo apt install -y \
		ripgrep \
		texlive-latex-base \
		texlive-latex-recommended \
		texlive-latex-extra \
		texlive-bibtex-extra \
		texlive-science \
		biber \
		latexmk \
		zathura

git:
	@echo "Setting .gitconfig..."
	@git config --global user.name "Kailas B. Kahler"
	@git config --global core.editor nvim
	@git config --global commit.verbose true
	@git config --global alias.lol "log --graph --oneline --decorate --color --all"
	@echo "Done!"

vim:
	@echo -n "Copying .vimrc..."
	@cp .vimrc ~/.vimrc
	@echo "Done!"

nvim: vim
	@echo "Downloading nvim..."
	@curl -LO https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
	@tar -xzf nvim-linux64.tar.gz
	@echo "Installing nvim..."
	@sudo rm -rf /opt/neovim
	@sudo mv nvim-linux64 /opt/neovim
ifeq ($(shell grep 'export PATH=$$PATH:/opt/neovim/bin' ~/.bashrc),)
	@echo 'export PATH=$$PATH:/opt/neovim/bin' >> ~/.bashrc
endif
	@echo "Copying init.lua..."
	@rm -rf ~/.config/nvim
	@mkdir ~/.config/nvim
	@cp init.lua ~/.config/nvim
	@cp -r lua ~/.config/nvim
	@echo "Done!"

verible:
	@echo "Downloading verible..."
	@curl -LO https://github.com/chipsalliance/verible/releases/download/v0.0-3756-gda9a0f8c/verible-v0.0-3756-gda9a0f8c-linux-static-x86_64.tar.gz
	@tar -xzf verible-v0.0-3756-gda9a0f8c-linux-static-x86_64.tar.gz
	@echo "Installing verible..."
	@sudo rm -rf /opt/verible
	@sudo mv verible-v0.0-3756-gda9a0f8c /opt/verible
	ifeq ($(shell grep -c 'export PATH=$$PATH:/opt/verible/bin' ~/.bashrc), 0)
		echo 'export PATH=$$PATH:/opt/verible/bin' >> ~/.bashrc
	endif
	@echo "Done!"
