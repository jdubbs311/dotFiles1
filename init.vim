set nocompatible              " be iMproved, required
filetype off                  " required

"Basic Highlighting
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu           " See current line number 
set nowrap

" How to keep history
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" Highlight as you search
set incsearch

" Line numbers are relative
set relativenumber

" Will allow you to have edited buffers in the background open
set hidden

" When you hit bottom will start scrolling when 8 away
set scrolloff=8

" Enable autocompletion
set wildmode=longest,list,full

"Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Splits open to the right and below
set splitbelow splitright 

set colorcolumn=80

" PLUGINS
call plug#begin()
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
"Plug 'junegunn/fzf' 

" Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox

" MAPPINGS
" n for normal mode, no - nore recursive execution
let mapleader = " "
imap jj <Esc>

" NerdTree
nnoremap <C-f> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
    \ exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" Navvigating between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Creating splits
"nnoremap <C-l> <C-w>v:NERDTree<CR>
nnoremap <C-l> <C-w>v<CR>
nnoremap <C-j> <C-w>s<CR>

" Insert an empty new line without entering insert mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Telescope Stuff
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>ps :lua require('telescope.builtin').
    \ grep_string({ search = vim.fn.input("Grep For > ")})<CR>

