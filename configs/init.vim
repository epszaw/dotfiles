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
Plug 'vim-scripts/BufOnly.vim'
Plug 'kien/ctrlp.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dyng/ctrlsf.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'mhartington/oceanic-next'
Plug 'neomake/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'

" Deoplete – autocomplete for evetethyng
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"
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

" Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

" Other
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }

call plug#end()
call neomake#configure#automake('nw', 750)

function! s:goyo_enter()
  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

colorscheme gruvbox
syntax enable
set encoding=UTF-8
set number
set relativenumber
set incsearch
set wildignore+=*/tmp/*,*/node_modules/*,*/dist/*,*/build/*
set hid
set autochdir
set autowrite
set autoread
set background=dark
set termguicolors

let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:nerdtree_sync_cursorline = 1
let g:neomake_javascript_enabled_makers = ['eslint']
let g:rg_command = 'rg --vimgrep -S'
let g:ctrlsf_default_root = 'project'
let g:goyo_height=95
let g:goyo_width=90
let g:polyglot_disabled=['vue']
let g:vue_pre_processors='detect_on_enter'
let g:paredit_mode = 1
let dart_format_on_save = 1
let dart_style_guide = 2
let g:lsc_auto_map = v:true

map <Leader> <Plug>(easymotion-prefix)
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap jj <Esc>
nmap <Esc> :noh<CR>
nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-l> :wincmd l<CR>
noremap <C-p> :CtrlP<CR>
noremap f w
noremap <S-f> b
noremap <C-t> :CtrlPBuffer<CR>
noremap <C-Shift-F> :Goyo<CR>
noremap <C-b> :NERDTreeToggle<CR>
noremap <Leader>gf :CtrlSF
noremap <Leader>rf :%s
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
