" Keymap
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

nmap <SPACE> <Nop>
noremap <Leader><Space> :ProjectFiles<CR>
noremap <Leader>p :ProjectFiles<CR>

noremap <Leader>e :NERDTreeToggle<CR>

" Buffers
noremap <Leader>bb :Buffers<CR>
noremap <Leader>bn :bnext<CR>
noremap <Leader>bp :bprevious<CR>
noremap <Leader>bo :BufOnly<CR>
noremap <Leader>bO :BufOnly!<CR>

" Search
noremap <Leader>/ "hy:PRg <C-r>h<CR>
noremap <Leader>fR "hy:CtrlSF <C-r>h<CR>
noremap <Leader>fr "hy:%s@<C-r>h@<C-r>h@gc<left><left><left>
noremap <Leader>fg "hy:PRg <C-r>h<CR>

" Git
noremap <Leader>gg :G<CR>
noremap <Leader>gc :Git commit<CR>
noremap <Leader>gd :Gdiffsplit!<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gl :Git log<CR>
noremap <Leader>gP :Git push<CR>
noremap <Leader>gp :Git pull<CR>

" Linters/fixers
noremap <Leader>laf :ALEFix<CR>

" Test
noremap <Leader>Tf :TestFile<CR>
