set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python'

source ~/.vimrc

lua require('CoC')
