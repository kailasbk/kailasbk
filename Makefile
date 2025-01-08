NVIM := v0.10.1
VERIBLE := v0.0-3756-gda9a0f8c

INSTALL_PREFIX ?= ~/.local
RC_PATH ?= ~/.bashrc

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
	@echo "Done installing apt packages!"

git:
	@echo "Setting .gitconfig..."
	@git config --global user.name "Kailas B. Kahler"
	@git config --global commit.verbose true
	@git config --global alias.lol "log --graph --oneline --decorate --color --all"
	@echo "Done setting .gitconfig!"

vim:
	@echo "Copying .vimrc..."
	@cp .vimrc ~/.vimrc
	@echo "Using vim for git commits..."
	@git config --global core.editor "vim"
	@echo "Done installing vim!"

nvim: vim
	@echo "Downloading nvim..."
	@curl -sLO https://github.com/neovim/neovim/releases/download/$(NVIM)/nvim-linux64.tar.gz
	@echo "Extracting nvim..."
	@tar -xzf nvim-linux64.tar.gz
	@echo "Installing nvim..."
	@mkdir -p $(INSTALL_PREFIX)
	@mkdir -p $(INSTALL_PREFIX)/bin
	@cp nvim-linux64/bin/* $(INSTALL_PREFIX)/bin
	@mkdir -p $(INSTALL_PREFIX)/lib
	@cp -r nvim-linux64/lib/* $(INSTALL_PREFIX)/lib
	@mkdir -p $(INSTALL_PREFIX)/share
	@cp -r nvim-linux64/share/* $(INSTALL_PREFIX)/share
	@if [ $$(grep -c 'export PATH=$$PATH:$(INSTALL_PREFIX)/bin' $(RC_PATH)) -eq 0 ]; then \
		echo "Adding nvim to PATH..."; \
		echo 'export PATH=$$PATH:$(INSTALL_PREFIX)/bin' >> $(RC_PATH); \
	else \
		echo "PATH already includes nvim..."; \
	fi
	@if [ $$(grep -c 'alias vim="nvim"' $(RC_PATH)) -eq 0 ]; then \
		echo "Aliasing nvim as vim..."; \
		echo 'alias vim="nvim"' >> $(RC_PATH); \
	fi
	@echo "Copying init.lua..."
	@rm -rf ~/.config/nvim
	@mkdir ~/.config/nvim
	@cp init.lua ~/.config/nvim
	@cp -r lua ~/.config/nvim
	@echo "Using nvim for git commits..."
	@git config --global core.editor "nvim"
	@echo "Done installing nvim!"
