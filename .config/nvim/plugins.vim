call plug#begin('~/.local/share/nvim/plugged')

" Common
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'MattesGroeger/vim-bookmarks'
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
" Plug 'vim-test/vim-test'
" Plug 'junegunn/goyo.vim'

" Themes
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'

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

" HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'vue', 'typescript'] }

" CSS
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

" Other
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }

call plug#end()
