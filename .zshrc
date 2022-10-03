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
eval "$(oh-my-posh init zsh --config ~/.poshthemes/amro.omp.json)"

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
bindkey -M menuselect '^[[Z' reverse-menu-complete

#alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias btw='neofetch | lolcat'
alias ls='exa --icons --group-directories-first'
alias sl='exa --icons --group-directories-first'
le(){
if [[ -z $1 ]]; then
   exa --icons --tree --group-directories-first --git-ignore -L 1
 elif  [[ ( $1 == 'a' || $1 == '-a' ) && -z $2 ]];  then
   exa --icons --tree -a --group-directories-first -L 1
 elif  [[ $1 == [0-9] && -z $2 ]];  then
   exa --icons --tree --group-directories-first --git-ignore -L $1
 elif  [[ $1 == [0-9] && ( $2 == 'a' || $2 == '-a' )]];  then
   exa --icons --tree -a --group-directories-first -L $1
 elif  [[ ( $1 == 'a' || $1 == '-a' ) && $2 == [0-9] ]];  then
   exa --icons --tree -a --group-directories-first -L $2
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
alias do-bootcamp='cd ~/Programming/Projects/DCI/React'
alias dci='cd ~/Programming/Projects/DCI/React'
alias playground='cd ~/Programming/Playground/'
alias do-react='cd ~/Programming/Projects/React'
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

#plugins
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

