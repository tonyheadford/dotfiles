export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/local/pgsql/bin:$PATH
export MANPATH=/opt/local/share/man:/usr/local/man:$MANPATH
export CLICOLOR=1

export ORACLE=$HOME/oracle/instantclient_11_2
export PATH=$ORACLE:$PATH
export DYLD_LIBRARY_PATH=$ORACLE:$DYLD_LIBRARY_PATH
export TNS_ADMIN=$ORACLE
export SQLPATH=$ORACLE

#export EDITOR='mate_wait'
export EDITOR=vim
export PAGER=less

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# undocumented var for tar to prevent including resource forks (._xxxx) in archives
export COPYFILE_DISABLE=true

#stty erase 

EVENT_NOKQUEUE=yes

export PATH=/Applications/VICE/tools:$PATH
export PATH=$HOME/bin:$PATH

export EC2_HOME=$HOME/ec2-api-tools-1.5.0.1-2011.11.30
export PATH=$PATH:$EC2_HOME/bin
export PATH=$PATH:$HOME/v8/out/native

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# load the bash completion for git and change the prompt
source ~/.git-completion.bash
export PS1='[\W\[\e[36m\]$(__git_ps1 "(%s) ")\[\e[0m\]]\$ '

export PATH=~/.rvm/bin:$PATH # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

cd .. && cd - # ensure rvmrc is run when restoring shells at startup