#evn varaibles
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
export HISTFILE=$HOME/.zsh_history

#zsh options
setopt EXTENDED_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_MINUS
setopt PUSHD_IGNORE_DUPS
setopt CD_SILENT

#enable theme
eval "$(oh-my-posh init zsh --config ~/.poshthemes/craver_mod.omp.json)"

#ctrl-w respects "/", etc...
WORDCHARS=

#ctrl-leftarrow ctrl-rightarrow jump one word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

#tab autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit

#alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias btw='neofetch | lolcat'
alias ls='exa --icons --group-directories-first'
alias le='exa -a --icons --group-directories-first'
alias do-test='cd ~/Programming/Testing && code .'
alias do-documentation='cd ~/Programming/Documentation/Javascript && code .'
alias do-bootcamp='cd ~/Programming/Projects/DCI/Javascript/section-02 && git clone'
alias vim='nvim'
alias cl='clear'
alias dci='cd ~/Programming/Projects/DCI/Javascript/section-02'
alias dirs='dirs -v'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias free='free -g'
alias du='du -h'

#plugins
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

