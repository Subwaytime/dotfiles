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
alias larnew="composer create-project laravel/laravel"
alias new="cd ~/work/dotfiles/bun && bun run dev"
alias com="composer"
alias ls="nnn -de"

# Replace npm command with pnpm for convience
alias npx=pnpm exec
alias npm=pnpm

# Quick updates
alias npmup="pnpm add -g pnpm"
alias comup="sudo /usr/local/bin/composer self-update"

# -------------------------------- #
# System Aliases
# -------------------------------- #
alias up="sudo nala update && sudo nala upgrade && flatpak update && npmup && comup && bun upgrade"
alias cclear="sudo apt autoclean && sudo apt autoremove && sudo apt clean && sudo flatpak uninstall --unused"
alias add="sudo nala install"
alias del="sudo nala remove --purge"
alias pkg="dpkg -l | grep"

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
