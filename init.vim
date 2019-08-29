call plug#begin('~/.local/share/nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rakr/vim-one'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'a-x-/vim-cyr'

" Deoplete – autocomplete for evetethyng
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

let g:deoplete#enable_at_startup = 1

" Neomake – neovim linter
Plug 'neomake/neomake'

" Airline
Plug 'vim-airline/vim-airline'

" Themes
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

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
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'clojurescript'] }

"=======================================================================
" HTML dev
"=======================================================================

Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
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
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" Nerdtree
let NERDTreeShowHidden=1

" Linting
call neomake#configure#automake('nw', 750)
	
let g:neomake_javascript_enabled_makers = ['eslint']

" Commond editor settings
set encoding=UTF-8
set number
set relativenumber
set incsearch
set wildignore+=*/tmp/*,*/node_modules/*,*/dist/*,*/build/*

" Appearance
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme nord
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Keybindings
noremap <C-b> :NERDTreeToggle<CR>

" Disabling native arrows
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

map <C-h> :bp<CR>
map <C-l> :bn<CR>

map <Esc> :noh<CR>

" Navigation between vim windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Quick quit from insert mode without esc
imap jj <Esc>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Replace Leader for Easymotion
map <Leader> <Plug>(easymotion-prefix)
