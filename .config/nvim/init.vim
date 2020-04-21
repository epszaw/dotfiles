call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInit' }
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'jpalardy/vim-slime'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'
Plug 'agreco/vim-citylights'
Plug 'haishanh/night-owl.vim'
Plug 'morhetz/gruvbox'

" JS
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescriptreact'] }
Plug 'posva/vim-vue', { 'for': ['javascript', 'typescript'] }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Clojure
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'clojurescript'] }

" Go
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoInstallBinaries' }

" HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'vue', 'typescript'] }

" CSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus', 'sss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

" Elm
Plug 'ElmCast/elm-vim'

" Python
Plug 'psf/black'

" " Other
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }
Plug 'cespare/vim-toml'

call plug#end()

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
set background=dark
colorscheme gruvbox
set termguicolors
set t_Co=256


syntax enable

" Definitions
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:nerdtree_sync_cursorline = 1
let g:rg_command = 'rg --vimgrep -S'
let g:ctrlsf_default_root = 'project'
let g:polyglot_disabled = ['vue']
let g:vue_pre_processors = 'detect_on_enter'
let g:paredit_mode = 1
let dart_format_on_save = 1
let dart_style_guide = 2
let g:lsc_auto_map = v:true
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\ 'left': [['mode', 'paste'],
	\	   ['gitbranch', 'filename', 'modified']],
        \ 'right': [['percent'],
	\	    ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'filetype']]
	\ },
	\ 'component_function': {
	\       'gitbranch': 'fugitive#head',
      	\       'filename':'LightlineFilename'
	\ }
	\}
let g:lightline.component_expand = {
        \ 'linter_checking': 'lightline#ale#checking',
        \ 'linter_warnings': 'lightline#ale#warnings',
        \ 'linter_errors': 'lightline#ale#errors',
        \ 'linter_ok': 'lightline#ale#ok',
        \ }
let g:ale_fixers = {
	\ "*": 		   ["remove_trailing_lines", "trim_whitespace"],
	\ "vue":    	   ["prettier", "eslint"],
	\ "javascript":    ["prettier", "eslint"],
	\ "typescript":    ["prettier", "eslint"],
	\ "svelte":    	   ["prettier", "eslint"],
	\ "sass": 	   ["prettier", "stylelint"],
	\ "scss": 	   ["prettier", "stylelint"],
	\ "css": 	   ["prettier", "stylelint"],
	\ "sss": 	   ["prettier", "stylelint"]
	\}
let g:ale_fix_on_save = 1

" Functions
function! LightlineFilename()
  let filename = expand('%:p')

  if (filename == '')
  	return '[No Name]'
  endif

  let filenameSplit = split(filename, '/')

  return reverse(filenameSplit)[0]
endfunction

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
	\ 'coc-rls',
	\ 'coc-vetur',
	\ 'coc-json',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-go',
	\ 'coc-svelte',
	\ 'coc-python',
	\ 'coc-prettier',
	\ 'coc-tsserver'])
command! ProjectFiles execute 'Files' s:find_git_root()

command! SetLightTheme call SetLightTheme('gruvbox')

command! SetDarkTheme call SetDarkTheme('gruvbox')

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

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
noremap f w
noremap <S-f> b
noremap <C-t> :Buffers<CR>
noremap <C-e> :NERDTreeToggle<CR>
noremap <C-f>g "hy:CtrlSF <C-r>h<CR>
noremap <C-f>r "hy:%s@<C-r>h@<C-r>h@gc<left><left><left>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
noremap <C-d> <C-d>
