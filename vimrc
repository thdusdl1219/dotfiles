
" auto-download for vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



" vim-plug

call plug#begin()
Plug 'tpope/vim-sensible'
call plug#end()


set rtp+=~/.fzf
