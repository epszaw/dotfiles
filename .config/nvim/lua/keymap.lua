local wk = require("which-key")

wk.register({
  n = "New tab",
  p = "Find folder file",
  ["<space>"] = "Find project file",
  r = "Replace",
  R = "Find globally",
  F = "Fix autofixable",
  q = "Close",
  Q = "Close other buffers",
  b = {
    name = "Buffers",
    b = "Find buffer",
    n = "Next",
    p = "Previous",
  },
  e = "Explorer",
  g = {
    name = "Git",
    g = "Status",
    c = "Commit",
    p = "Pull",
    P = "Push",
    d = "Diff",
    b = "Blame",
  },
  w = {
    name = "Window",
    s = "Split horizontally",
    v = "Split vertically",
    h = "Focus left window",
    j = "Focus bottom window",
    k = "Focus top window",
    l = "Focus right window",
    H = "Increase window width",
    L = "Decrease window width",
  },
  t = {
    name = "Test",
    t = "Run nearest test",
    f = "Run file tests",
    s = "Run test suite",
    l = "Run last test",
  },
  l = {
    name = "LSP",
    h = "Hover (show docs)",
  },
}, { prefix = "<Leader>" })

vim.cmd "map  f <Plug>(easymotion-bd-f)"
vim.cmd "nmap f <Plug>(easymotion-overwin-f)"
vim.cmd "nmap <SPACE> <Nop>"
-- vim.cmd "noremap <Leader><Space> :Telescope git_files<CR>"
-- vim.cmd "noremap <Leader>p :Telescope find_files<CR>"
-- vim.cmd "noremap <C-p> :Telescope find_files<CR>"
-- vim.cmd "noremap <Leader>b :Telescope buffers<CR>"
-- vim.cmd "noremap <C-b> :Telescope buffers<CR>"
vim.cmd "noremap <Leader><Space> :ProjectFiles<CR>"

vim.cmd "noremap <Leader>bb :Buffers<CR>"
vim.cmd "noremap <Leader>bn :bnext<CR>"
vim.cmd "noremap <Leader>bp :bprevious<CR>"

vim.cmd "nmap <Esc> :noh<CR>"

vim.cmd "noremap <Leader>F :ALEFix<CR>"

vim.cmd "nmap <silent> <S-k> :wincmd k<CR>"
vim.cmd "nmap <silent> <S-j> :wincmd j<CR>"
vim.cmd "nmap <silent> <S-h> :wincmd h<CR>"
vim.cmd "nmap <silent> <S-l> :wincmd l<CR>"
vim.cmd "noremap <C-d> <C-d>"

vim.cmd "noremap <Leader>wh :wincmd h<CR>"
vim.cmd "noremap <C-h> :wincmd h<CR>"
vim.cmd "noremap <Leader>wl :wincmd l<CR>"
vim.cmd "noremap <C-l> :wincmd l<CR>"
vim.cmd "noremap <Leader>wj :wincmd j<CR>"
vim.cmd "noremap <C-j> :wincmd j<CR>"
vim.cmd "noremap <Leader>wk :wincmd k<CR>"
vim.cmd "noremap <C-k> :wincmd k<CR>"
vim.cmd "noremap <Leader>wv :vs<CR>"
vim.cmd "noremap <Leader>ws :sp<CR>"
vim.cmd "noremap <Leader>wL <C-w>10>"
vim.cmd "noremap <Leader>wH <C-w>10<"

vim.cmd "noremap H gT"
vim.cmd "noremap L gt"
vim.cmd "noremap <Leader>n :tabnew<CR>"
vim.cmd "noremap <Leader>q :q<CR>"
vim.cmd "noremap <Leader>Q :BufOnly<CR>"

vim.cmd "noremap <Leader>e :NvimTreeToggle<CR>"

vim.cmd 'noremap <Leader>R "hy:CtrlSF <C-r>h<CR>'
vim.cmd 'noremap <Leader>r "hy:%s@<C-r>h@<C-r>h@gc<left><left><left>'

vim.cmd "noremap <Leader>gg :G<CR>"
vim.cmd "noremap <Leader>gc :Git commit<CR>"
vim.cmd "noremap <Leader>gp :Git pull<CR>"
vim.cmd "noremap <Leader>gP :Git push<CR>"
vim.cmd "noremap <Leader>gb :Git blame<CR>"
vim.cmd "noremap <Leader>gd :Gdiffsplit!<CR>"

vim.cmd "noremap <Leader>tt :TestNearest<CR>"
vim.cmd "noremap <Leader>tf :TestFile<CR>"
vim.cmd "noremap <Leader>ts :TestSuite<CR>"
vim.cmd "noremap <Leader>tl :TestLast<CR>"

vim.cmd "noremap <Leader>lh <cmd>lua vim.lsp.buf.hover()<CR>"

-- TODO: move to another lua file
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
