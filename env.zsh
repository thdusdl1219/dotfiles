
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
    # export ZSH="/Users/soyeon/.antigen/bundles/robbyrussell/oh-my-zsh"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    #alias drawio="/Applications/draw.io.app/Contents/MacOS/draw.io"
    ;;
  Linux)
    # Commands for Linux go here
    export PATH=/snap/bin:/home/soyeon/bin:$PATH
    export LD_LIBRARY_PATH=/home/soyeon/z3/build:$LD_LIBRARY_PATH
    export PYTHONPATH=/home/soyeon/z3/build/python:$PATHONPATH
    # export ZSH="/home/soyeon/.antigen/bundles/robbyrussell/oh-my-zsh"
    ;;
esac
alias readlink=greadlink
alias grammarly="open -a 'Grammarly Desktop'"

# Init pyenv-virtualenv, but 
# unload precmd hook _pyenv_virtualenv_hook
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Warning: unloading the following hook breaks command
# `pyenv activate/deactivate`. Please switch to
# `pyenv shell env_name`, `pyenv shell --unset` instead.
if [[ -n $ZSH_VERSION ]]; then
  autoload -Uz add-zsh-hook
  add-zsh-hook -D precmd _pyenv_virtualenv_hook
fi
if [[ -n $BASH_VERSION ]]; then
  PROMPT_COMMAND="${PROMPT_COMMAND/_pyenv_virtualenv_hook;/}"
fi

export LLVM_HOME=/usr/lib/llvm-11
export LLVM_COMPILER=clang
export WLLVM_OUTPUT_LEVEL=WARNING
export WLLVM_OUTPUT_FILE=/home/soyeon/wrapper.log
export PATH=$LLVM_HOME/bin:$PATH
export PATH=/home/soyeon/vuln-genome/tools/retdec/retdec/bin:/home/soyeon/.pyenv/plugins/pyenv-virtualenv/shims:/home/soyeon/.pyenv/shims:/home/soyeon/.pyenv/bin:/home/soyeon/tmp/jdk-11.0.6+10/bin:/snap/bin:/home/soyeon/bin:/home/soyeon/.pyenv/plugins/pyenv-virtualenv/shims:/home/soyeon/.pyenv/shims:/home/soyeon/.pyenv/bin:/home/soyeon/tmp/jdk-11.0.6+10/bin:/snap/bin:/home/soyeon/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/soyeon/.fzf/bin:/snap/bin:$PATH

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.zi/polaris/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# for skyfire
HOSTNAME=$(hostname)
if [[ ${HOSTNAME} == "skyfire" ]]; then
  export RUST_SYSROOT=/home/soyeon/.rustup/toolchains/nightly-2023-06-01-x86_64-unknown-linux-gnu
  export LD_LIBRARY_PATH=$RUST_SYSROOT/lib:$LD_LIBRARY_PATH
  export RANLZ_REDIS_HOSTNAME=127.0.0.1:5252
fi
if [[ ${HOSTNAME} == "ravage" ]]; then
  export RUST_SYSROOT=/home/soyeon/.rustup/toolchains/nightly-2023-06-01-x86_64-unknown-linux-gnu
  export LD_LIBRARY_PATH=$RUST_SYSROOT/lib:$LD_LIBRARY_PATH
  export RANLZ_REDIS_HOSTNAME=127.0.0.1:6379
fi

alias wttr="curl wttr.in/Atlanta\?m"
PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT
alias clr="clear"
alias g="git"
alias t="tig"
alias pager="vim -R +AnsiEsc"

# rust based command line utilities
# ls -> exa
if hash exa 2>/dev/null; then
    alias ls='exa --icons'
    alias l='exa -l --icons --all --group-directories-first --git'
    alias ll='exa -l --icons --all --all --group-directories-first --git'
    alias lt='exa -T --icons --git-ignore --level=2 --group-directories-first'
    alias llt='exa -lT --icons --git-ignore --level=2 --group-directories-first'
    alias lT='exa -T --icons --git-ignore --level=4 --group-directories-first'
else
    alias l='ls -lah'
    alias ll='ls -alF'
    alias la='ls -A'
fi
# cat -> bat
if hash bat 2>/dev/null; then
    alias cat='bat'
fi

if hash nvim 2>/dev/null; then
  alias vu="nvim"
  alias v="nvim"
  alias vim="nvim"
  alias vi="nvim"
  alias ovim="\vim"
fi

export CARGO_PROFILE_DEV_BUILD_OVERRIDE_DEBUG=true
