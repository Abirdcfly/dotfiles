# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/fupeng/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE="nerdfont-complete"   #设置 powerlevel9k 的字体
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  tmux
  git
  colored-man-pages
  extract
  autojump
  zsh-autosuggestions
  vi-mode
  svn
  git-open
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# svn
prompt_svn() {
    local rev branch
    if in_svn; then
        rev=$(svn_get_rev_nr)
        branch=$(svn_get_branch_name)
        if [ `svn_dirty_choose_pwd 1 0` -eq 1 ]; then
            prompt_segment yellow black
            echo -n "$rev@$branch"
            echo -n "±"
        else
            prompt_segment green black
            echo -n "$rev@$branch"
        fi
    fi
}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias proxy='export http_proxy=http://127.0.0.1:1081;export https_proxy=$http_proxy;export all_proxy=$http_proxy'
export PATH=${PATH}:/usr/local/sbin
alias tbjconfig="ssh tbjconfig"
alias disproxy='unset http_proxy https_proxy all_proxy'

export GOROOT="$(brew --prefix golang)/libexec"
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOBIN
alias gl='GOOS=linux GOARCH=amd64 go build -v'
alias mysqll='mycli -uroot -h localhost'
#alias top='htop'
#alias diff='icdiff'
alias ip='curl ip.cn'
alias buu="brew update && brew upgrade"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias v="vim"
setopt HIST_IGNORE_SPACE
alias ping="prettyping --nolegend"
export PATH="/usr/local/opt/ipython@5/bin:$PATH"
#alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"
alias gosrc="cd /usr/local/opt/go/libexec/src"
alias tf="open -a Finder ./"
alias cman='man -M /usr/local/share/man/zh_CN'
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles #替换为清华源
alias vimtmux="vim ~/.tmux.conf"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export GOPROXY=https://goproxy.cn

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time battery ssh dir vcs status background_jobs_joined command_execution_time go_version)  #左边符号
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode)    # 右边显示zsh 的vi_mode
POWERLEVEL9K_STATUS_OK=false  #status正常是大部分情况,不需要显示图标
POWERLEVEL9K_VI_INSERT_MODE_STRING='' #正常情况下zsh都在Insert模式下.不需要显示INSERT干扰注意力
POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD=90  # 电量90以下在显示

source $(dirname $(gem which colorls))/tab_complete.sh  # https://github.com/athityakumar/colorls
alias lc='colorls -lA --sd'
alias rm="rm -i"
alias c="code ."
alias gc="git cz"
alias cl="source ~/.zshrc && clear"
alias up="upgrade_oh_my_zsh; brew update -v; brew upgrade -v; brew cask upgrade -v; brew cleanup -v"
