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

  return ' ' . FugitiveHead()
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

let g:gruvbox_contrast_light = 'soft'

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
colorscheme gruvbox

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
	\ "svelte":    	   ["eslint"],
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
let g:ale_fix_on_save = 0
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
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
let g:slime_target = 'tmux'
let g:slime_default_config = { 'socket_name': 'default', 'target_pane': '{last}' }
let g:EasyMotion_leader_key = ''
