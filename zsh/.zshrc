# -------------------------------- #
# Custom Theme
# -------------------------------- #
# Installation:
# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"

# -------------------------------- #
# Plugins
# -------------------------------- #
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-z
)

# -------------------------------- #
# Work Aliases
# -------------------------------- #
alias lar="php artisan"
alias new="bun ~/work/bun-tools/creator"
alias buni="bun ~/work/bun-tools/updater"
alias com="composer"
alias ls="nnn -de"

# Replace npm command with pnpm for convience
alias npx=pnpm exec
alias npm=pnpm

# Quick updates
alias npmup="pnpm add -g pnpm"
alias comup="sudo /usr/local/bin/composer self-update"
alias fixvs="sudo chown -R $(whoami) /usr/share/code"

# -------------------------------- #
# System Aliases
# -------------------------------- #
alias up="sudo nala update && sudo nala upgrade && flatpak update && npmup && comup && bun upgrade && fixvs"
alias cclear="sudo apt autoclean && sudo apt autoremove && sudo apt clean && sudo flatpak uninstall --unused && history -c"
alias add="sudo nala install"
alias del="sudo nala remove --purge"
alias pkg="dpkg -l | grep"
alias vpn="nordvpn"

# -------------------------------- #
# PATH
# -------------------------------- #

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# https://ohmyz.sh/
source $ZSH/oh-my-zsh.sh

# bun completions
# [ -s "/home/subway/.bun/_bun" ] && source "/home/subway/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NPM/NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Updating mysql leads to an annoying Bug where the error.log file is deleted
# This should fix it
function fixsql() {
	LOG_FOLDER="/var/log/mysql"

	if [ ! -d "$LOG_FOLDER" ]; then
		sudo mkdir $LOG_FOLDER;
	fi

	if [ ! -f "$LOG_FOLDER/error.log" ]; then
		cd $LOG_FOLDER && sudo touch "error.log";
	fi

	sudo chown -R mysql:mysql $LOG_FOLDER && sudo service mysql restart;
}
