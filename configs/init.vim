call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'junegunn/goyo.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'danro/rename.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'kien/ctrlp.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dyng/ctrlsf.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'heavenshell/vim-jsdoc'
Plug 'tpope/vim-vinegar'
Plug 'danro/rename.vim'
Plug 'dracula/vim'
Plug 'mhartington/oceanic-next'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Deoplete – autocomplete for evetethyng
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  " Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

" JS
Plug 'prettier/vim-prettier'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue', { 'for': ['javascript', 'typescript'] }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'clojurescript'] }
Plug 'venantius/vim-cljfmt', { 'for': ['clojure', 'clojurescript'] }
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'clojurescript'] }

" Go
Plug 'fatih/vim-go', { 'for': ['go'] }

" HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'vue'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }

" CSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus', 'sss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

" Ruby
Plug 'vim-ruby/vim-ruby'

" Other
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }

call plug#end()

" Common editor settings
set encoding=UTF-8
set number
set relativenumber
set incsearch
set wildignore+=*/tmp/*,*/node_modules/*,*/dist/*,*/build/*
set hid
set autochdir
set autowrite
syntax enable
set autoread
set background=dark
set termguicolors
colorscheme OceanicNext 

let g:deoplete#enable_at_startup = 1

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:nerdtree_sync_cursorline = 1

call neomake#configure#automake('nw', 750)
let g:neomake_javascript_enabled_makers = ['eslint']

let g:rg_command = 'rg --vimgrep -S'

let g:ctrlsf_default_root = 'project'

let g:goyo_height=95
let g:goyo_width=90

function! s:goyo_enter()
  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

let g:airline#extensions#tabline#enabled = 0

let g:polyglot_disabled=['vue']
let g:vue_pre_processors='detect_on_enter'

let g:paredit_mode = 1

noremap <C-p> :CtrlP<CR>

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

nmap <Esc> :noh<CR>

nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-l> :wincmd l<CR>

imap jj <Esc>

noremap f w
noremap <S-f> b

map <Leader> <Plug>(easymotion-prefix)

noremap <C-t> :CtrlPBuffer<CR>

noremap <C-Shift-F> :Goyo<CR>

noremap <C-b> :NERDTreeToggle<CR>

noremap <Leader>gf :CtrlSF
noremap <Leader>rf :%s

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

