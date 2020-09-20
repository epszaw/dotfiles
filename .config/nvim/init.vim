call plug#begin('~/.local/share/nvim/plugged')

" Common
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInit' }
Plug 'dense-analysis/ale'
Plug 'vim-test/vim-test'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-endwise'
Plug 'easymotion/vim-easymotion'

" Themes
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Rigellute/rigel'
Plug 'cocopon/iceberg.vim'

" JS
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescriptreact'] }
Plug 'posva/vim-vue', { 'for': ['javascript', 'typescript'] }
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Lisp
Plug 'wlangstroth/vim-racket'

" Go
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoInstallBinaries' }

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'vue', 'typescript'] }

" CSS
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

" Other
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }

call plug#end()

" Functions
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! InstallCocPlugins(plugins)
  execute 'CocInstall ' . join(a:plugins, ' ')
endfunction

" Themes quick switching
function! SetDarkTheme(theme)
	execute 'set background=dark'
	execute 'colorscheme ' . a:theme
endfunction

function! SetLightTheme(theme)
	execute 'set background=light'
	execute 'colorscheme ' . a:theme
endfunction

" Commands
command! CocInit call InstallCocPlugins([
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-go',
	\ 'coc-solargraph',
	\ 'coc-prettier',
	\ 'coc-tsserver'])

command! ProjectFiles execute 'Files' s:find_git_root()

command! LightMode call SetLightTheme('iceberg')

command! DarkMode call SetDarkTheme('iceberg')

command! ZenMode execute 'Goyo 80x95%'

" command! -bang -nargs=* NRg
"   \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

syntax enable

set encoding=UTF-8
set number
set relativenumber
set incsearch
set wildignore+=*/tmp/*,*/node_modules/*,*/dist/*,*/build/*,*/.next/*,*/out/*
set hid
set autochdir
set autowrite
set autoread
set cul
set termguicolors
set t_Co=256
set background=light
colorscheme iceberg

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_ackprg = 'rg'
let g:nerdtree_sync_cursorline = 1
let g:rg_command = 'rg --vimgrep -S'
let g:ctrlsf_default_root = 'project'
let g:polyglot_disabled = ['vue']
let g:vue_pre_processors = 'detect_on_enter'
let g:paredit_mode = 1
let g:lsc_auto_map = v:true
let g:ale_linters = {
	\ "ruby": 	   ["standardrb", "rubocop"],
	\ "vue":    	   ["eslint"],
	\ "javascript":    ["eslint"],
	\ "typescript":    ["eslint"],
	\ "sass": 	   ["stylelint"],
	\ "scss": 	   ["stylelint"],
	\ "css": 	   ["stylelint"],
	\ "markdown":	   ["yaspeller"],
	\}
let g:ale_fixers = {
	\ "*": 		   ["trim_whitespace"],
	\ "markdown":	   ["prettier"],
	\ "json":	   ["prettier"],
	\ "vue":    	   ["prettier", "eslint", "stylelint"],
	\ "javascript":    ["prettier", "eslint"],
	\ "typescript":    ["prettier", "eslint"],
	\ "sass": 	   ["prettier", "stylelint"],
	\ "scss": 	   ["prettier", "stylelint"],
	\ "css": 	   ["prettier", "stylelint"],
	\ "ruby":	   ["standardrb"],
	\}
let g:ale_fix_on_save = 0
let g:airline_theme = 'iceberg'
let g:airline#extensions#tabline#enabled = 1
let g:notes_directories = ['~/Documents/Notes']
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'String'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'info':    ['fg', 'Keyword'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Statement'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Keymap
nnoremap <silent> K :call <SID>show_documentation()<CR>
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
nmap <C-h> gT
nmap <C-l> gt
noremap <C-p> :ProjectFiles<CR>
noremap <C-t> :Buffers<CR>
noremap <C-e> :NERDTreeToggle<CR>
noremap <C-f>g "hy:CtrlSF <C-r>h<CR>
" noremap <C-f>rg "hy:NRg <C-r>h<CR>
noremap <C-f>r "hy:%s@<C-r>h@<C-r>h@gc<left><left><left>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
nmap <Leader>p :ALEFix<CR>
noremap <C-d> <C-d>
nmap <Leader>sp4 :vs<CR>:sp<CR><S-l>:sp<CR>
