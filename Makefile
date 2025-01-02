NVIM := v0.10.1
VERIBLE := v0.0-3756-gda9a0f8c

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
	@curl -sLO https://github.com/neovim/neovim/releases/download/$(NVIM)/nvim-linux64.tar.gz
	@echo "Extracting nvim..."
	@tar -xzf nvim-linux64.tar.gz
	@echo "Installing nvim..."
	@sudo rm -rf /opt/neovim
	@sudo mv nvim-linux64 /opt/neovim
	@if [ $$(grep -c 'export PATH=$$PATH:/opt/neovim/bin' ~/.bashrc) -eq 0 ]; then \
		echo "Adding nvim to PATH..."; \
		echo 'export PATH=$$PATH:/opt/neovim/bin' >> ~/.bashrc; \
	else \
		echo "PATH already includes nvim..."; \
	fi
	@echo "Copying init.lua..."
	@rm -rf ~/.config/nvim
	@mkdir ~/.config/nvim
	@cp init.lua ~/.config/nvim
	@cp -r lua ~/.config/nvim
	@echo "Done!"
