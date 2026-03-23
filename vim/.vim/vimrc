" ============================================================
"  ~/.vimrc — modern, fast, minimal
" ============================================================

" ── Plugin manager (vim-plug) ────────────────────────────────
call plug#begin('~/.vim/plugged')

  " Fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " File tree
  Plug 'preservim/nerdtree'

  " Status line
  Plug 'itchyny/lightline.vim'

  " Git integration
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Surround — change/add/delete surrounding chars
  Plug 'tpope/vim-surround'

  " Auto pairs — auto-close brackets, quotes
  Plug 'jiangmiao/auto-pairs'

  " Comment toggler — gcc to comment line, gc in visual
  Plug 'tpope/vim-commentary'

  " Multiple cursors — Ctrl+n
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Indent guides
  Plug 'Yggdroot/indentLine'

  " Syntax highlighting (broad language support)
  Plug 'sheerun/vim-polyglot'

  " Colorscheme
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }

  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'

  " Start screen
  Plug 'mhinz/vim-startify'

call plug#end()

" ── Core ─────────────────────────────────────────────────────
set nocompatible
filetype plugin indent on
syntax on

set encoding=utf-8
set hidden                  " switch buffers without saving
set history=1000
set undofile                " persistent undo
set undodir=~/.vim/undo
set updatetime=100          " faster gitgutter refresh
set timeoutlen=400

" ── UI ───────────────────────────────────────────────────────
set number relativenumber   " relative line numbers
set cursorline              " highlight current line
set signcolumn=yes          " always show sign column (git, errors)
set scrolloff=8             " keep 8 lines above/below cursor
set sidescrolloff=8
set showcmd
set noshowmode              " lightline shows mode already
set laststatus=2
set termguicolors
colorscheme catppuccin_mocha

set splitright              " new vertical splits go right
set splitbelow              " new horizontal splits go below

" ── Search ───────────────────────────────────────────────────
set ignorecase smartcase    " smart case search
set incsearch hlsearch      " live highlight
set gdefault                " global replace by default

" ── Indentation ──────────────────────────────────────────────
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent

" ── Whitespace & wrapping ─────────────────────────────────────
set nowrap
set backspace=indent,eol,start
set list listchars=tab:→\ ,trail:·,extends:>,precedes:<

" ── Clipboard ────────────────────────────────────────────────
set clipboard=unnamed       " yank/paste uses system clipboard

" ── Wild menu ────────────────────────────────────────────────
set wildmenu wildmode=longest:full,full
set wildignore+=*.o,*.pyc,node_modules/**,.git/**

" ── Performance ──────────────────────────────────────────────
set lazyredraw
set ttyfast

" ============================================================
"  Key mappings
" ============================================================

let mapleader = " "         " Space as leader

" --- Sanity ---
nnoremap ; :
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Q :q!<CR>

" --- Clear search highlight ---
nnoremap <leader>/ :nohlsearch<CR>

" --- Split navigation (like tmux) ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Split resize ---
nnoremap <leader>= <C-w>=
nnoremap <leader>> :vertical resize +5<CR>
nnoremap <leader>< :vertical resize -5<CR>
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>_ :resize -5<CR>

" --- Buffer navigation ---
nnoremap <Tab>   :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>b :Buffers<CR>

" --- FZF ---
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>' :Marks<CR>

" --- NERDTree ---
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>E :NERDTreeFind<CR>

" --- Git (fugitive) ---
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log --oneline<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gb :Git blame<CR>

" --- Quickfix / location list ---
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

" --- Move lines up/down (Alt+j/k) ---
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" --- Duplicate line ---
nnoremap <leader>D yyp

" --- Select all ---
nnoremap <leader>a ggVG

" --- Better indenting (stay in visual mode) ---
vnoremap < <gv
vnoremap > >gv

" --- Open vimrc quickly ---
nnoremap <leader>, :e ~/.vimrc<CR>
nnoremap <leader>. :source ~/.vimrc<CR> \| :echo "vimrc reloaded!"<CR>

" ============================================================
"  Plugin config
" ============================================================

" --- lightline ---
let g:lightline = {
  \ 'colorscheme': 'catppuccin_mocha',
  \ 'active': {
  \   'left':  [['mode','paste'], ['gitbranch','readonly','filename','modified']],
  \   'right': [['lineinfo'], ['percent'], ['filetype','fileencoding']]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }

" --- NERDTree ---
let g:NERDTreeShowHidden      = 1
let g:NERDTreeMinimalUI       = 1
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\.git$', 'node_modules', '\.pyc$', '__pycache__']
" Close vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
  \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" --- gitgutter ---
let g:gitgutter_sign_added    = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed  = '▎'
highlight GitGutterAdd    guifg=#a6e3a1
highlight GitGutterChange guifg=#f9e2af
highlight GitGutterDelete guifg=#f38ba8

" --- indentLine ---
let g:indentLine_char      = '│'
let g:indentLine_color_gui = '#313244'

" --- FZF layout ---
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.75, 'border': 'rounded' } }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" --- Startify header ---
let g:startify_custom_header = startify#pad([
  \ '  ██╗   ██╗██╗███╗   ███╗',
  \ '  ██║   ██║██║████╗ ████║',
  \ '  ██║   ██║██║██╔████╔██║',
  \ '  ╚██╗ ██╔╝██║██║╚██╔╝██║',
  \ '   ╚████╔╝ ██║██║ ╚═╝ ██║',
  \ '    ╚═══╝  ╚═╝╚═╝     ╚═╝',
  \ ])
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Recent files'] },
  \ { 'type': 'dir',       'header': ['   Current dir: '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions'] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ ]
let g:startify_bookmarks = [ '~/.vimrc', '~/.tmux.conf' ]
let g:startify_session_persistence = 1

" ============================================================
"  Auto commands
" ============================================================

augroup vimrc
  autocmd!
  " Strip trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
  " Return to last cursor position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
    \ | exe "normal! g'\"" | endif
  " Relative numbers only in normal mode
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup END
