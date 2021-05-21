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
Plug 'tpope/vim-endwise'
" Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vim-which-key'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'vim-test/vim-test'
Plug 'arthurxavierx/vim-caser'
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/paredit.vim'

" Themes
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

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

" Go
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoInstallBinaries' }

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Clojure
Plug 'tpope/vim-fireplace'

" HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'vue', 'typescript'] }

" CSS
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

" Other
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }
Plug 'zah/nim.vim'

call plug#end()

call which_key#register('<Space>', "g:which_key_map")

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

function! LightLineGitBranch()
  let l:branch = FugitiveHead()

  if (l:branch == '')
    return ''
  endif

  return '♃ ' . FugitiveHead()
endfunction

function! LightLineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! LightLineFilename()
  let l:filename = expand('%:t')
  return WebDevIconsGetFileTypeSymbol(l:filename) . ' ' . expand('%:t')
endfunction

command! -bang -nargs=* PRg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

" Commands
command! CocInit call InstallCocPlugins([
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-go',
	\ 'coc-solargraph',
	\ 'coc-prettier',
	\ 'coc-tsserver',
	\ 'coc-rls',
	\ 'coc-sourcekit',
	\ 'coc-elixir',
	\ 'coc-pyright'])

command! ProjectFiles execute 'Files' s:find_git_root()

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
set wildignore+=*/tmp/*,*/node_modules/*,*/dist/*,*/build/*,*/.next/*,*/out/*,*/.DS_Store/*
set hid
set autochdir
set autowrite
set autoread
set cul
set termguicolors
set t_Co=256
set background=light
set mouse=n
colorscheme iceberg

let mapleader=' '
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
	\ "ruby": 	   ["rubocop"],
	\ "vue":    	   ["eslint"],
	\ "javascript":    ["eslint"],
	\ "typescript":    ["eslint"],
	\ "sass": 	   ["stylelint"],
	\ "scss": 	   ["stylelint"],
	\ "css": 	   ["stylelint"],
	\ "markdown":	   ["yaspeller"],
	\ "clojure":	   ["clj-kondo"],
	\}
let g:ale_fixers = {
	\ "*": 		   ["trim_whitespace"],
	\ "markdown":	   ["prettier", "trim_whitespace"],
	\ "svg":	   ["prettier"],
	\ "html":	   ["prettier"],
	\ "json":	   ["prettier"],
	\ "vue":    	   ["eslint", "stylelint"],
	\ "svelte":    	   ["eslint", "stylelint"],
	\ "javascript":    ["eslint"],
	\ "typescript":    ["eslint"],
	\ "clojure":	   ["clj-kondo"],
	\ "sass": 	   ["prettier", "stylelint"],
	\ "scss": 	   ["prettier", "stylelint"],
	\ "css": 	   ["prettier", "stylelint"],
	\ "ruby":	   ["rubocop"],
	\}
let g:ale_fix_on_save = 1
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [
      \		['mode'],
      \         ['gitbranch', 'readonly',  'filename', 'modified']],
      \   'right': [
      \		['percent'],
      \         ['lineinfo'],
      \		['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
      \   	['filetype']],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightLineGitBranch',
      \   'icon_filename': 'LightLineFilename',
      \ },
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:notes_directories = ['~/Documents/Notes']
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
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
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0
let g:which_key_map =  {}
let g:slime_target = 'tmux'
let g:slime_default_config = { 'socket_name': 'default', 'target_pane': '{last}' }

" Keymap
nnoremap <silent> K :call <SID>show_documentation()<CR>
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
noremap <C-d> <C-d>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

nmap <SPACE> <Nop>
noremap <Leader><SPACE> :ProjectFiles<CR>
let g:which_key_map['SPACE'] = 'project-files'

noremap <Leader>e :NERDTreeToggle<CR>
let g:which_key_map.e = 'nerd-tree-toggle'

" Windows navigation
let g:which_key_map.w = { 'name': '+window' }
noremap <Leader>wh :wincmd h<CR>
noremap <C-h> :wincmd h<CR>
let g:which_key_map.w.l = 'focus-right-window'
noremap <Leader>wl :wincmd l<CR>
noremap <C-l> :wincmd l<CR>
let g:which_key_map.w.h = 'focus-left-window'
noremap <Leader>wj :wincmd j<CR>
noremap <C-j> :wincmd j<CR>
let g:which_key_map.w.k = 'focus-top-window'
noremap <Leader>wk :wincmd k<CR>
noremap <C-k> :wincmd k<CR>
let g:which_key_map.w.j = 'focus-bottom-window'
noremap <Leader>wsv :vs<CR>
let g:which_key_map.w.s = { 'name': '+split' }
let g:which_key_map.w.s.v = 'split-window-horizontally'
noremap <leader>wsh :sp<CR>
let g:which_key_map.w.s.h = 'split-window-vertically'
noremap <leader>wL <C-w>10>
let g:which_key_map.w.L = 'increase-window-size'
noremap <leader>wH <C-w>10<
let g:which_key_map.w.H = 'decrease-window-size'

" Tabs
let g:which_key_map.t = { 'name': '+tabs' }
noremap <Leader>th gT
noremap H gT
let g:which_key_map.t.h = 'prev-tab'
noremap <Leader>tl gt
noremap L gt
let g:which_key_map.t.b = 'next-tab'
noremap <Leader>tn :tabnew<CR>
let g:which_key_map.t.n = 'new-tab'
noremap <Leader>tq :tabclose<CR>
let g:which_key_map.t.c = 'close-tab'

" Buffers
let g:which_key_map.b = { 'name': '+buffer' }
noremap <Leader>bb :Buffers<CR>
let g:which_key_map.b.b = 'current-buffers'
noremap <Leader>bn :bnext<CR>
let g:which_key_map.b.n = 'next-buffer'
noremap <Leader>bp :bprevious<CR>
let g:which_key_map.b.p = 'previous-buffer'
noremap <Leader>bo :BufOnly<CR>
let g:which_key_map.b.o = 'close-other-buffers'
noremap <Leader>bO :BufOnly!<CR>
let g:which_key_map.b.o = 'close-other-buffers-forced'

" Search
let g:which_key_map.f = { 'name': '+search' }
noremap <Leader>fR "hy:CtrlSF <C-r>h<CR>
let g:which_key_map.f.R = 'global-find-and-replace'
noremap <Leader>fg "hy:PRg <C-r>h<CR>
let g:which_key_map.f.g = 'global-find'
noremap <Leader>fr "hy:%s@<C-r>h@<C-r>h@gc<left><left><left>
let g:which_key_map.f.r = 'find-and-replace'

" Git
let g:which_key_map.g = { 'name': '+git' }
noremap <Leader>gs :G<CR>
let g:which_key_map.g.s = 'git-status'
noremap <Leader>gc :Gcommit<CR>
let g:which_key_map.g.c = 'git-commit'
noremap <Leader>gd :Gdiffsplit!<CR>
let g:which_key_map.g.d = 'git-diff-split'
noremap <Leader>gb :Gblame<CR>
let g:which_key_map.g.b = 'git-blame'
noremap <Leader>gl :Glog<CR>
let g:which_key_map.g.l = 'git-log'
noremap <Leader>gP :Gpush<CR>
let g:which_key_map.g.P = 'git-push'
noremap <Leader>gp :Gpull<CR>
let g:which_key_map.g.p = 'git-pull'

" Linters/fixers
let g:which_key_map.l = { 'name': '+linters' }
let g:which_key_map.l.a = { 'name': '+ale' }
noremap <Leader>laf :ALEFix<CR>
let g:which_key_map.l.a.f = 'ale-fix'

" Test
let g:which_key_map.T = { 'name': '+tests' }
noremap <Leader>Tf :TestFile<CR>
let g:which_key_map.T.f = 'test-file'

" Help
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
