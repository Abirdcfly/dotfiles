
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# brew 补全
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/fupeng/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE="nerdfont-complete"   #设置 powerlevel10k 的字体
ZSH_THEME="powerlevel10k/powerlevel10k"

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
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
    macos
    jira
    history
    command-not-found
    colored-man-pages
    branch
    tmux
    git
    colored-man-pages
    extract
    autojump
   zsh-autosuggestions
    you-should-use
    vi-mode
    svn
    git-open
    kubectl
    minikube
    pipenv
    virtualenv
    docker
    fast-syntax-highlighting
    dash
    git-auto-fetch
    golang
    helm
    httpie
)

#
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
alias proxy='export http_proxy=http://127.0.0.1:7890;export https_proxy=$http_proxy;export all_proxy=socks5://127.0.0.1:7890'
alias charles='export http_proxy=http://127.0.0.1:12345;export https_proxy=$http_proxy;export all_proxy=$http_proxy'
export PATH=${PATH}:/usr/local/sbin
alias t="open -a Typora.app"
alias tbjconfig="ssh tbjconfig"
alias disproxy='unset http_proxy https_proxy all_proxy'

export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOBIN
alias gl='GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -v'
alias mysqll='mycli -uroot -h localhost -pgzgzgz'
#alias top='htop'
#alias diff='icdiff'
# alias ip='curl ip.cn'
alias buu="brew update && brew upgrade"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias v="/usr/bin/vim"
setopt HIST_IGNORE_SPACE
alias pping="prettyping --nolegend"
export PATH="/usr/local/opt/ipython@5/bin:$PATH"
#alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"
alias gosrc="cd /usr/local/opt/go/libexec/src"
alias tf="open -a Finder ./"
alias cman='man -M /usr/local/share/man/zh_CN'
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottles #替换为清华源
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
alias vimtmux="vim ~/.tmux.conf"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#goproxy.cn  七牛云的代理
export GO111MODULE=auto
export GOPROXY=https://goproxy.cn
export GOPRIVATE='*tenxcloud.com'

# Customise the Powerlevel9k prompts
# 使用 github.com/romkatv/powerlevel10k 这个9k的升级版后，配置文件在～/.p10k.zsh中
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time battery ssh dir vcs status background_jobs_joined command_execution_time go_version virtualenv kubectx_prompt_info)  #左边符号
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode)    # 右边显示zsh 的vi_mode
# POWERLEVEL9K_STATUS_OK=false  #status正常是大部分情况,不需要显示图标
# POWERLEVEL9K_VI_INSERT_MODE_STRING='' #正常情况下zsh都在Insert模式下.不需要显示INSERT干扰注意力
# POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD=90  # 电量90以下在显示
# POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20  # 20的电量就是Low了。颜色会变

source $(dirname $(gem which colorls))/tab_complete.sh  # https://github.com/athityakumar/colorls
bindkey '^n' autosuggest-accept #zshautosuggestion 选定快捷键

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# sshpass
export SSHPASS=root

# 自定义alias
alias lc='colorls -lA --sd'
alias rm="rm -i"
alias c="code ."
alias gc="git cz"
alias cl="source ~/.zshrc; clear"
alias up="brew update ; brew upgrade --greedy ;  brew upgrade --cask --greedy ; brew cleanup ; brew autoremove ; omz update"
alias gitdiffw="git diff --ignore-space-change"
# alias vim="nvim"
alias rm='safe-rm'
alias gst='git status --ignored'
alias ll='ls -altrh'
alias kd='kubectl describe'
alias sshp="sshpass -e ssh"
alias ms='proxy && minikube start --registry-mirror=https://docker.mirrors.ustc.edu.cn --memory=8192 --cpus=6 --kubernetes-version=v1.14.3 --disk-size=30g --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook" --docker-env NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,10.0.2.0/24,192.168.64.0/24,172.17.0.0/24 --docker-env HTTP_PROXY=http://192.168.64.1:1081 --docker-env HTTPS_PROXY=http://192.168.64.1:1081 --cache-images --insecure-registry=192.168.64.1:5000 --vm-driver=hyperkit'
alias cg='curl -v google.com'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias rmrf='rm -rf'
alias kall="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n"
alias kgcrd="kubectl get crd -A"
alias kecrd="kubectl edit crd"
alias kdelcrd="kubectl delete crd"
alias kdcrd="kubectl describe crd"
alias ke="kubectl edit"
alias kg="kubectl get"
alias kdpf="kubectl delete pod --grace-period=0 --force"
# alias kl="kubetail"
alias or="operator-sdk run --local"

# 自定义环境变量
export PATH="$PATH:/Users/fupeng/DataSync/Work/istio/istio-1.9.1/bin:$HOME/.cargo/bin"
export KUBECONFIG="$HOME/.kube/1.78.config:$HOME/.kube/1.113.config:$HOME/.kube/2.23.config:$HOME/.kube/local.config:$HOME/.kube/1.224.config:$HOME/.kube/bare.config:$HOME/.kube/bare2.config"
export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.1.1/16,192.168.99.0/24,192.168.39.0/24,192.168.64.0/24,172.17.0.0/20
ulimit -S -n 10240
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi


# 自定义函数
fm() {
  ag --nobreak --nonumbers --noheading --markdown . | grep "$1" | fzf
}

#export GOSUMDB=gosum.io+ce6e7565+AY5qEHUk/qmHc5btzW45JVoENfazw8LielDsaI+lEbq6 #经常404
export PATH="/usr/local/opt/helm@2/bin:$PATH"
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"
alias gfu="git fetch upstream"

export PATH="/usr/local/opt/node@10/bin:$PATH"
export EDITOR='vim'
alias run="tmuxinator start default"
alias ssh='TERM=xterm-256color \ssh'
# hub
export GITHUB_USER="Abirdcfly"
# export PATH="/usr/local/opt/node@12/bin:$PATH"
# export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export JIRA_URL="http://jira.tenxcloud.21vianet.com/"
export JIRA_DEFAULT_ACTION=dashboard

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

unsetopt correct_all
