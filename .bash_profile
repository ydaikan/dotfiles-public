export PS1="[\w]> "

alias v='nvim'
alias g='git'
alias fish='chsh -s /usr/local/bin/fish'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export XDG_CONFIG_HOME="$HOME/dotfiles-public/.config"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
