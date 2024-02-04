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

export LLVM_HOME=/usr/lib/llvm-11
export LLVM_COMPILER=clang
export WLLVM_OUTPUT_LEVEL=WARNING
export WLLVM_OUTPUT_FILE=/home/soyeon/wrapper.log
export PATH=$LLVM_HOME/bin:$PATH
export PATH=/home/soyeon/vuln-genome/tools/retdec/retdec/bin:/home/soyeon/.pyenv/plugins/pyenv-virtualenv/shims:/home/soyeon/.pyenv/shims:/home/soyeon/.pyenv/bin:/home/soyeon/tmp/jdk-11.0.6+10/bin:/snap/bin:/home/soyeon/bin:/home/soyeon/.pyenv/plugins/pyenv-virtualenv/shims:/home/soyeon/.pyenv/shims:/home/soyeon/.pyenv/bin:/home/soyeon/tmp/jdk-11.0.6+10/bin:/snap/bin:/home/soyeon/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/soyeon/.fzf/bin:/snap/bin:$PATH

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.zi/polaris/bin:$PATH
