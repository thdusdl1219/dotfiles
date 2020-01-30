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

" CoC / autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale' " not sure if it's necessary.

Plug 'christoomey/vim-tmux-navigator'

" snippet plugin
"" Plug 'SirVer/ultisnips'


call plug#end()

" fzf setting
set rtp+=~/.fzf
nnoremap <C-g> :Rg<Cr>
nnoremap <C-f> :FZF<Cr>

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" NERDTree setting
source ~/.vim/config/NERDTree.vim

" CoC setting
source ~/.vim/config/CoC.vim

" Using mouse
set mouse=a

" Airline setting
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set nu

" buffer switching

nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>t :enew<cr>
nmap <leader>q :bp <BAR> bd #<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
