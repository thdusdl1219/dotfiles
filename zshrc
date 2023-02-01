zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# source Antigen
source ~/.dotfiles/zsh/antigen.zsh


# antigen
antigen use oh-my-zsh
antigen bundle git
#antigen bundle marlonrichert/zsh-autocomplete
antigen bundle command-not-found
antigen bundle andrewferrier/fzf-z
antigen bundle changyuheng/zsh-interactive-cd
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle supercrabtree/k
antigen bundle clvv/fasd

# Do OS dependant stuff
case `uname` in
  Darwin)
    # Commands for OS X go here
    antigen bundle macos 
    eval "$(/usr/libexec/path_helper)"
    ;;
  Linux)
    # Commands for Linux go here
    ;;
esac

antigen theme romkatv/powerlevel10k

antigen apply

case `uname` in
  Darwin)
    # Commands for OS X go here
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export PATH=/Users/soyeon/Library/Python/2.7/bin:$PATH
    export PATH=/Users/soyeon/bin:/opt/local/bin:/opt/local/sbin:$PATH
    export PATH="/usr/local/opt/llvm/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
    export CPPFLAGS="-I/usr/local/opt/llvm/include"
    # Path to your oh-my-zsh installation.
    export ZSH="/Users/soyeon/.antigen/bundles/robbyrussell/oh-my-zsh"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    ;;
  Linux)
    # Commands for Linux go here
    export PATH=/snap/bin:/home/soyeon/bin:$PATH
    export LD_LIBRARY_PATH=/home/soyeon/z3/build:$LD_LIBRARY_PATH
    export PYTHONPATH=/home/soyeon/z3/build/python:$PATHONPATH
    export ZSH="/home/soyeon/.antigen/bundles/robbyrussell/oh-my-zsh"
    ;;
esac
alias readlink=greadlink

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export NVM_LAZY=1

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fasd command-not-found nvm)


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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias vu=/usr/bin/vi
alias v=/usr/bin/vi
alias wttr="curl wttr.in/Atlanta\?m"
PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT
alias vim="nvim"
alias vi="nvim"
alias ovim="\vim"
alias clr="clear"
alias ls="exa"

bindkey ' ' magic-space

bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
export EDITOR='vi'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=/home/soyeon/tmp/jdk-11.0.6+10/bin:$PATH
export PATH="$PATH:/snap/bin"

# autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'


# If your ~/.profile sources ~/.bashrc,
# the lines need to be inserted before the part
# that does that. See the README for another option.

# If you have ~/.bash_profile, make sure that it
# also executes the above lines -- e.g. by
# copying them there or by sourcing ~/.profile

# Load pyenv into the shell by adding
# the following to ~/.bashrc:

export LLVM_HOME=/usr/lib/llvm-11
export LLVM_COMPILER=clang
export WLLVM_OUTPUT_LEVEL=WARNING
export WLLVM_OUTPUT_FILE=/home/soyeon/wrapper.log
export PATH=$LLVM_HOME/bin:$PATH
PATH=~/vuln-genome/tools/retdec/retdec/bin:~/.pyenv/plugins/pyenv-virtualenv/shims:~/.pyenv/shims:~/.pyenv/bin:~/tmp/jdk-11.0.6+10/bin:/snap/bin:~/bin:~/.pyenv/plugins/pyenv-virtualenv/shims:~/.pyenv/shims:~/.pyenv/bin:~/tmp/jdk-11.0.6+10/bin:/snap/bin:~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/.antigen/bundles/robbyrussell/oh-my-zsh/lib:~/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:~/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found:~/.antigen/bundles/andrewferrier/fzf-z:~/.antigen/bundles/changyuheng/zsh-interactive-cd:~/.antigen/bundles/zsh-users/zsh-syntax-highlighting:~/.antigen/bundles/zsh-users/zsh-autosuggestions:~/.antigen/bundles/zsh-users/zsh-history-substring-search:~/.antigen/bundles/supercrabtree/k:~/.antigen/bundles/clvv/fasd:~/.antigen/bundles/romkatv/powerlevel10k:~/.fzf/bin:/snap/bin
eval "$(pyenv init -)"
alias grammarly="open -a 'Grammarly Desktop'"

# Make sure to restart your entire logon session
# for changes to profile files to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

export LLVM_HOME=/usr/lib/llvm-11
export LLVM_COMPILER=clang
export WLLVM_OUTPUT_LEVEL=WARNING
export WLLVM_OUTPUT_FILE=/home/soyeon/wrapper.log
export PATH=$LLVM_HOME/bin:$PATH
PATH=/home/soyeon/vuln-genome/tools/retdec/retdec/bin:/home/soyeon/.pyenv/plugins/pyenv-virtualenv/shims:/home/soyeon/.pyenv/shims:/home/soyeon/.pyenv/bin:/home/soyeon/tmp/jdk-11.0.6+10/bin:/snap/bin:/home/soyeon/bin:/home/soyeon/.pyenv/plugins/pyenv-virtualenv/shims:/home/soyeon/.pyenv/shims:/home/soyeon/.pyenv/bin:/home/soyeon/tmp/jdk-11.0.6+10/bin:/snap/bin:/home/soyeon/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/soyeon/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/home/soyeon/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:/home/soyeon/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found:/home/soyeon/.antigen/bundles/andrewferrier/fzf-z:/home/soyeon/.antigen/bundles/changyuheng/zsh-interactive-cd:/home/soyeon/.antigen/bundles/zsh-users/zsh-syntax-highlighting:/home/soyeon/.antigen/bundles/zsh-users/zsh-autosuggestions:/home/soyeon/.antigen/bundles/zsh-users/zsh-history-substring-search:/home/soyeon/.antigen/bundles/supercrabtree/k:/home/soyeon/.antigen/bundles/clvv/fasd:/home/soyeon/.antigen/bundles/romkatv/powerlevel10k:/home/soyeon/.fzf/bin:/snap/bin

export PATH=$HOME/.cargo/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# for skyfire
HOSTNAME=$(hostname)
if [[ ${HOSTNAME} == "skyfire" ]]; then
  export RUST_SYSROOT=/home/soyeon/.rustup/toolchains/nightly-2022-08-01-x86_64-unknown-linux-gnu
  export LD_LIBRARY_PATH=$RUST_SYSROOT/lib:$LD_LIBRARY_PATH
  export RANLZ_REDIS_HOSTNAME=127.0.0.1:5252
fi
