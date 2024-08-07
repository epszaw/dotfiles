vim.g.mapleader = " "
vim.g.EasyMotion_leader_key = ""

require("plugins")
require("keymap")

vim.g.gruvbox_material_background = "soft"
vim.g.everforest_background = "hard"
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1

-- not need, due treesitter package
-- vim.cmd "syntax enable"
vim.cmd "set encoding=UTF-8"
vim.cmd "set number"
vim.cmd "set relativenumber"
vim.cmd "set incsearch"
vim.cmd "set wildignore+=*/tmp/*,*/node_modules/*,*/dist/*,*/build/*,*/.next/*,*/out/*,*/.DS_Store/*"
vim.cmd "set hid"
vim.cmd "set autochdir"
vim.cmd "set autowrite"
vim.cmd "set autoread"
vim.cmd "set cul"
vim.cmd "set wrap"
vim.cmd "set termguicolors"
vim.cmd "set t_Co=256"
vim.cmd "set background=light"
vim.cmd "set mouse=n"
vim.cmd "colorscheme alabaster"

if not (vim.g.vscode) then
  vim.cmd "let $FZF_DEFAULT_COMMAND='rg --files --hidden'"
  vim.cmd "let g:rg_command='rg --vimgrep -S'"
  vim.cmd "let g:rg_derive_root=1"
  vim.cmd "let g:rg_highlight=1"

  vim.cmd([[
  function! FindGitRoot()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  endfunction
  ]])
  vim.cmd "command! ProjectFiles execute 'Files' FindGitRoot()"
end

