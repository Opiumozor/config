# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Disable folder check
ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn brew osx docker pip python web-search cp)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ALIAS

# ls
if [[ $OSTYPE = darwin* ]]; then
  alias ls="ls -GFh"
else
  alias ls="ls -Fh --color=auto"
fi
alias l='ls -l'
alias la='ls -la'

# basics
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias grep='grep --color=auto'

# emacs
alias emacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw'
alias ne='emacs'

# docker
alias docker_start=". '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
alias docker_cclean='docker rm $(docker ps -a -q)'
alias docker_iclean='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'

# python
alias activate='source ./env/bin/activate'

# git
alias gco='git checkout'
alias gs='git status'
alias gss='git status --short'
alias gd='git diff --color | diff-so-fancy | less'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias glog='git log --graph --decorate --oneline --color --all'
alias gpl='git pull'
alias grebase='git pull --rebase origin master'

# misc
alias fr='t=$(($(tput cols)/3));for FR in $(seq $(tput lines));do printf "\e[44m%${t}s\e[47m%${t}s\e[41m%${t}s\e[0m\n";done;'
alias update_recharge_config="~/Work/customcheckout/env/bin/fab -f ~/Work/customcheckout/fabfile/digital_ocean.py ssh_config:key='~/.ssh/recharge',user='alex' > ~/.ssh/config.d/recharge;sed -ie '$ d' ~/.ssh/config.d/recharge"

# SET ENV
export EDITOR=emacs
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:/usr/local/go/bin:$HOME/Library/Python/2.7/bin:$HOME/Library/Python/3.7/bin
export ANSIBLE_HOSTS=~/.ansible_hosts

# CUSTOM COMMANDS
clean()
{
    SEARCH='.'
    if [ ${1} ]
    then
        SEARCH=${1}
    fi
    find ${SEARCH} \( -name "*~" -or -name ".*~" \) -exec rm -fv {} \;
}

# THEME CFG
BULLETTRAIN_PROMPT_CHAR=\>
BULLETTRAIN_PROMPT_ORDER=(
    status
    custom
    dir
    perl
    ruby
    virtualenv
    go
    git
    hg
)
