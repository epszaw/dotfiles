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
Plug 'herrbischoff/cobalt2.vim'

" Deoplete – autocomplete for evetethyng
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

" Neomake – neovim linter
Plug 'neomake/neomake'

" Airline
Plug 'vim-airline/vim-airline'

" Themes
Plug 'arcticicestudio/nord-vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"=======================================================================
" Javascript dev
"=======================================================================

Plug 'prettier/vim-prettier'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue', { 'for': ['javascript', 'typescript'] }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

"=======================================================================
" Clojure dev
"=======================================================================

Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'clojurescript'] }
Plug 'venantius/vim-cljfmt', { 'for': ['clojure', 'clojurescript'] }
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'clojurescript'] }

"=======================================================================
" GO dev
"=======================================================================

Plug 'fatih/vim-go', { 'for': ['go'] }

"=======================================================================
" HTML dev
"=======================================================================

Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'vue'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }

"=======================================================================
" CSS dev
"=======================================================================

Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus', 'sss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

"=======================================================================
" Other dev
"=======================================================================
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }


" Initialize plugin system
call plug#end()

" Plugins settings
let g:deoplete#enable_at_startup = 1

" Nerdtree
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" Linting
call neomake#configure#automake('nw', 750)
let g:neomake_javascript_enabled_makers = ['eslint']

" Grep reassign
let g:rg_command = 'rg --vimgrep -S'
let g:ctrlsf_default_root = 'project'

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
colorscheme cobalt2 

" Distraction free mode configuration
let g:goyo_height=95
let g:goyo_width=90

function! s:goyo_enter()
  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Keybindings
noremap <C-p> :CtrlP<CR>

" Disabling native arrows
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Reset current highlight
nmap <Esc> :noh<CR>

" Navigation between vim windows
nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-l> :wincmd l<CR>

" Quick quit from insert mode without esc
imap jj <Esc>

" Much simple panels resize
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>

" More simple Navigation
noremap f w
noremap <S-f> b

" Replace Leader for Easymotion
map <Leader> <Plug>(easymotion-prefix)

" Open all current buffers, like <Cmd+T> in sublime text or vs code
noremap <C-t> :CtrlPBuffer<CR>

" Distraction free mode
noremap <C-Shift-F> :Goyo<CR>

" Netrw explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = netrw_gitignore#Hide()
 
noremap <C-b> :Lexplore<CR>
