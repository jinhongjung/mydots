
all: install-vim install-tmux install-shell

install-vim:
	bash bin/install_vim.sh

install-tmux:
	bash bin/install_tmux.sh

install-shell:
	bash bin/install_shell.sh
