# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NODE_OPTIONS=--openssl-legacy-provider
export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

ZSH_THEME="purify"

plugins=(git nvm golang)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim"
alias artisan="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias gt="git status"
alias gd="git diff"
alias tinker="php artisan tinker"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias lg="lazygit"

export NVM_LAZY=1
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh --no-use" ] && \. "$NVM_DIR/nvm.sh --no-use" # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
#source /usr/share/nvm/init-nvm.sh

# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do time $shell -i -c exit; done
# }

# zprof
