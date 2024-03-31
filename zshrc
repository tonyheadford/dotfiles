export CLICOLOR=1
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

alias migrate="bundle exec rake db:migrate"
alias rollback="bundle exec rake db:rollback"
alias routes="bin/rails routes"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias b="bundle"
alias be="bundle exec"
alias rc="bundle exec rails console"
alias rs="bundle exec rails server"
alias rt="bundle exec rails test"
alias gs="git status"
alias rsp="bundle exec rspec"
alias psp="bundle exec rake parallel:spec RAILS_ENV=test"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(rbenv init -)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source ~/.docker_vars_for_deploy

export PATH="/Applications/love.app/Contents/MacOS":$PATH
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin":$PATH
export GPG_TTY=$(tty)
export DISABLE_SPRING=true
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin":$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
