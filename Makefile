
all: install-nvim install-tmux install-shell

install-nvim:
	bash bin/install_nvim.sh

install-tmux:
	bash bin/install_tmux.sh

install-shell:
	bash bin/install_shell.sh

install-zsh:
	bash bin/install_zsh.sh
