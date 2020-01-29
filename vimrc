" auto-download for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" fzf
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" statusline / tabline / bufferline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

call plug#end()

" fzf setting
set rtp+=~/.fzf
nnoremap <C-g> :Rg<Cr>
nnoremap <C-f> :FZF<Cr>

" NERDTree setting
source ~/.vim/config/NERDTree.vim

" Using mouse
set mouse=a

" Airline setting
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" buffer switching

nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>t :enew<cr>
nmap <leader>q :bp <BAR> bd #<CR>

