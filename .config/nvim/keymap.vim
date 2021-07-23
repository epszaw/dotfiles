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

map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

nmap <SPACE> <Nop>
noremap <Leader><Space> :ProjectFiles<CR>
noremap <Leader>p :ProjectFiles<CR>
let g:which_key_map["Space"] = 'project-files'
let g:which_key_map.p = 'project-files'

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
noremap <Leader>wv :vs<CR>
let g:which_key_map.w.v = 'split-window-vertically'
noremap <leader>ws :sp<CR>
let g:which_key_map.w.s = 'split-window-horizontally'
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
noremap <Leader>/ "hy:PRg <C-r>h<CR>
let g:which_key_map["/"] = 'global-find'
let g:which_key_map.f = { 'name': '+search' }
noremap <Leader>fR "hy:CtrlSF <C-r>h<CR>
let g:which_key_map.f.R = 'global-find-and-replace'
noremap <Leader>fr "hy:%s@<C-r>h@<C-r>h@gc<left><left><left>
let g:which_key_map.f.r = 'find-and-replace'
noremap <Leader>fg "hy:PRg <C-r>h<CR>
let g:which_key_map.f.g = 'global-find'

" Git
let g:which_key_map.g = { 'name': '+git' }
noremap <Leader>gg :G<CR>
let g:which_key_map.g.g = 'git-status'
noremap <Leader>gc :Git commit<CR>
let g:which_key_map.g.c = 'git-commit'
noremap <Leader>gd :Gdiffsplit!<CR>
let g:which_key_map.g.d = 'git-diff-split'
noremap <Leader>gb :Git blame<CR>
let g:which_key_map.g.b = 'git-blame'
noremap <Leader>gl :Git log<CR>
let g:which_key_map.g.l = 'git-log'
noremap <Leader>gP :Git push<CR>
let g:which_key_map.g.P = 'git-push'
noremap <Leader>gp :Git pull<CR>
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
