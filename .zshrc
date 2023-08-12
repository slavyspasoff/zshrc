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
eval "$(starship init zsh)"

#ctrl-w respects "/", etc...
WORDCHARS=

#disable terminal suspense Ctrl+S Ctrl+Q
if [[ -t 0 && $- = *i* ]]
then
  stty -ixon
fi

#ctrl-leftarrow ctrl-rightarrow jump one word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

#tab autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
bindkey -M menuselect '^[[Z' reverse-menu-complete

#alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias btw='neofetch | lolcat'
alias ls='exa --icons --group-directories-first'
alias sl='exa --icons --group-directories-first'
alias hist='history'


le(){
 if [[ $1 != [0-9] ]]; then
   exa --icons --tree --group-directories-first -L 1 $@
 elif [[ $1 == [0-9] ]]; then
   exa  --icons --tree --group-directories-first -L $@
 fi
}
tree(){
 if [[ -z $1 ]]; then
   exa --icons --tree --group-directories-first -D --git-ignore
 elif  [[ ( $1 == 'a' || $1 == '-a' ) && -z $2 ]];  then
   exa --icons --tree -a --group-directories-first -D
 elif  [[ $1 == [0-9] && -z $2 ]];  then
   exa --icons --tree --group-directories-first -D --git-ignore -L $1
 elif  [[ $1 == [0-9] && ( $2 == 'a' || $2 == '-a' )]];  then
   exa --icons --tree -a --group-directories-first -D -L $1
 elif  [[ ( $1 == 'a' || $1 == '-a' ) && $2 == [0-9] ]];  then
   exa --icons --tree -a --group-directories-first -D -L $2
 fi    
}
alias ll='exa -la --icons --group-directories-first'
alias la='exa -a --icons --group-directories-first'
alias do-test='cd ~/Programming/Testing && code .'
alias do-documentation='cd ~/Programming/Documentation/Javascript && code .'
alias do-bootcamp='cd ~/Programming/Projects/DCI/Node'
alias dci='cd ~/Programming/Projects/DCI'
alias playground='cd ~/Programming/Playground/'
alias learnings='cd ~/Programming/Learnings/'
alias do-react='cd ~/Programming/Projects/React'
alias do-node='cd ~/Programming/Projects/Nodejs'
alias do-todo='cd ~/Programming/Projects/DCI/TodoApp'
alias vim='nvim'
alias cl='clear'
alias lc='clear'
alias dirs='dirs -v'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias free='free -m'
alias du='du -h'
alias natours='cd ~/Programming/Playground/udemy_node/4-natours/starter'

#plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
