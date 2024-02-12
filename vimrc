" TODO: replace init.vim to init.lua
" auto-download for vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'powerman/vim-plugin-AnsiEsc'

" vim session management
" Plug 'tpope/vim-obsession'

" nerdtree
" Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'

" fzf
Plug 'junegunn/fzf.vim'

" statusline / tabline / bufferline
Plug 'nvim-lualine/lualine.nvim'
Plug 'AndreM222/copilot-lualine'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
Plug 'bling/vim-bufferline'

" LSP / autocomplete
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'onsails/lspkind.nvim'
"Plug 'github/copilot.vim'

Plug 'zbirenbaum/copilot-cmp'

" with tmux
" Plug 'christoomey/vim-tmux-navigator'
Plug 'aserowy/tmux.nvim'

" undo tree
Plug 'simnalamburt/vim-mundo'

" language support
Plug 'sheerun/vim-polyglot'

" git
" Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdcommenter' " https://github.com/preservim/nerdcommenter
Plug 'godlygeek/tabular' " https://github.com/godlygeek/tabular
Plug 'majutsushi/tagbar' " https://github.com/majutsushi/tagbar
Plug 'Raimondi/delimitMate'

" snippet
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" theme
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'sainnhe/everforest'


" move cursor to last edit
Plug 'farmergreg/vim-lastplace'
Plug 'vim-scripts/lastpos.vim'

" python
"" Plug 'jmcantrell/vim-virtualenv', { 'for': 'python'}
Plug 'aserebryakov/vim-todo-lists'

" match (%) upgrade
Plug 'https://github.com/adelarsq/vim-matchit'

call plug#end()

" tagbar 
nmap <F8> :TagbarToggle<CR>

" fzf setting
set rtp+=~/.fzf
nnoremap <C-g> :Rg<Cr>
nnoremap <C-f> :FZF<Cr>

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" NERDTree setting
source ~/.vim/config/NERDTree.vim

" undo tree setting 
set undofile
set undodir=~/.vim/undo
nnoremap <F5> :MundoToggle<CR>
let g:mundo_width = 30
let g:mundo_preview_height = 40
let g:mundo_right = 1

" Using mouse
"" set mouse=a

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
set nu

" buffer switching
set hidden

nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>t :enew<cr>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

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

" theme
"colorscheme gruvbox 
"set bg=dark
if strftime('%H') >= 7 && strftime('%H') < 17
  set background=dark
else
  set background=dark
endif
colorscheme everforest

" NERDTree
let g:NERDTreeHijackNetrw=0

lua <<EOF
  local lsp_zero = require('lsp-zero')

  lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
  end)

  -- Mason LSP
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "jedi_language_server"},
    handlers = {
      lsp_zero.default_setup,
    },
  })

  require('lspconfig').rust_analyzer.setup({})
  require('lspconfig').jedi_language_server.setup({})
EOF

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require("lspkind")
  local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
  end

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- ['<C-Space>'] = cmp.mapping.complete(),
      -- ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end),
    }),
    sources = cmp.config.sources({
      { name = 'copilot' },
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),

    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol",
        max_width = 50,
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        symbol_map = { Copilot = "" },
      })
    }
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF

lua <<EOF
  -- https://github.com/zbirenbaum/copilot.lua
  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
  -- https://github.com/zbirenbaum/copilot-cmp
  require("copilot_cmp").setup()
EOF

lua <<EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'seoul256',
  },
  sections = {
    lualine_x = { { 'copilot', show_colors = true } ,'encoding', 'fileformat', 'filetype' }, -- I added copilot here
  }
}
require("tmux").setup()
EOF
