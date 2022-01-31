vim.g.mapleader = " "
vim.g.EasyMotion_leader_key = ""

require("plugins")
require("keymap")

vim.g.gruvbox_contrast_light = "medium"

vim.cmd "syntax enable"
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
vim.cmd "colorscheme hg"
vim.cmd "let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'"
vim.cmd "let g:rg_command = 'rg --vimgrep -S'"

vim.cmd "let g:goyo_height = '100%'"
vim.cmd "let g:goyo_width = 100"

vim.cmd([[
function! FindGitRoot()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
]])
vim.cmd "command! ProjectFiles execute 'Files' FindGitRoot()"

vim.g.slime_target = "tmux"
vim.g.slime_default_config = { 
  socket_name = 'default'; 
  target_pane = '{last}';
}

vim.g.ctrlsf_auto_preview = 0
vim.g.ctrlsf_confirm_save = 0
vim.g.ctrlsf_ackprg = 'rg'
vim.g.ctrlsf_default_root = 'project'

vim.g.ale_linters = {
  ruby = { "rubocop" };
  vue = { "eslint" };
  svelte = { "eslint" };
  javascript = { "eslint" };
  typescript = { "eslint" };
  sass = { "stylelint" };
  scss = { "stylelint" };
  css = { "stylelint" };
  markdown = { "yaspeller" };
  clojure = { "clj-kondo" };
  json = {};
}
vim.g.ale_fixers = {
  ["*"] = { "trim_whitespace" };
  markdown = { "prettier", "trim_whitespace" };
  svg = { "prettier" };
  html = { "prettier" };
  json = { "prettier" };
  vue = { "eslint", "stylelint" };
  svelte = { "eslint", "stylelint" };
  javascript = { "eslint" };
  typescript = { "eslint" };
  clojure = { "clj-kondo" };
  sass = { "prettier", "stylelint" };
  scss = { "prettier", "stylelint" };
  css = { "prettier", "stylelint" };
  ruby = { "rubocop" };
}
vim.g.ale_fix_on_save = 0

-- vim.g.vue_pre_processors = "detect_on_enter"
