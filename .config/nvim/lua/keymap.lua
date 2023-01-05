local wk = require("which-key")

vim.cmd "map  f <Plug>(easymotion-bd-f)"
vim.cmd "nmap f <Plug>(easymotion-overwin-f)"
vim.cmd "nmap <SPACE> <Nop>"
vim.cmd "nmap <Esc> :noh<CR>"

if not (vim.g.vscode) then
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
    t = {
      name = "Toggle",
      e = "Toggle project tree",
    },
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
      q = "Close window",
      s = "Split horizontally",
      v = "Split vertically",
      h = "Focus left window",
      j = "Focus bottom window",
      k = "Focus top window",
      l = "Focus right window",
      H = "Increase window width",
      L = "Decrease window width",
    },
    c = {
      name = "Code",
      i = "Show docs",
      I = "Open diagnostics",
      d = "Go to definition",
      D = "References",
      R = "Rename",
      C = "Connect REPL",
      e = "Eval",
      t = {
	name = "Test",
        t = "Run nearest test",
        f = "Run file tests",
        s = "Run test suite",
        l = "Run last test",
      }
    },
    m = {
      name = "Bookmarks",
      m = "Toggle",
      n = "Next",
      p = "Previous",
      a = "Show all",
      c = "Clear in current buffer",
      x = "Clear all",
    },
  }, { prefix = "<Leader>" })

  -- vim.cmd "noremap <Leader><Space> :Telescope git_files<CR>"
  -- vim.cmd "noremap <Leader>p :Telescope find_files<CR>"
  -- vim.cmd "noremap <C-p> :Telescope find_files<CR>"
  -- vim.cmd "noremap <Leader>b :Telescope buffers<CR>"
  -- vim.cmd "noremap <C-b> :Telescope buffers<CR>"
  vim.cmd "noremap <Leader><Space> :ProjectFiles<CR>"

  vim.cmd "noremap <Leader>bb :Buffers<CR>"
  vim.cmd "noremap <Leader>bn :bnext<CR>"
  vim.cmd "noremap <Leader>bp :bprevious<CR>"

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
  vim.cmd "noremap <Leader>wq :q<CR>"
  vim.cmd "noremap <Leader>wv :vs<CR>"
  vim.cmd "noremap <Leader>ws :sp<CR>"
  vim.cmd "noremap <Leader>wL <C-w>10>"
  vim.cmd "noremap <Leader>wH <C-w>10<"

  vim.cmd "noremap H gT"
  vim.cmd "noremap L gt"
  vim.cmd "noremap <Leader>n :tabnew<CR>"
  vim.cmd "noremap <Leader>q :q<CR>"
  vim.cmd "noremap <Leader>Q :BufOnly<CR>"

  vim.cmd "noremap <Leader>te :NvimTreeToggle<CR>"

  vim.cmd 'noremap <Leader>R "hy:CtrlSF <C-r>h<CR>'
  vim.cmd 'noremap <Leader>r "hy:%s@<C-r>h@<C-r>h@gc<left><left><left>'

  vim.cmd "noremap <Leader>gg :G<CR>"
  vim.cmd "noremap <Leader>gc :Git commit<CR>"
  vim.cmd "noremap <Leader>gp :Git pull<CR>"
  vim.cmd "noremap <Leader>gP :Git push<CR>"
  vim.cmd "noremap <Leader>gb :Git blame<CR>"
  vim.cmd "noremap <Leader>gd :Gdiffsplit!<CR>"

  vim.cmd "noremap <Leader>ci <cmd>lua vim.lsp.buf.hover()<CR>"
  vim.cmd "noremap <Leader>cd <cmd>lua vim.lsp.buf.definition()<CR>"
  vim.cmd "noremap <Leader>cD <cmd>lua vim.lsp.buf.references()<CR>"
  vim.cmd "noremap <Leader>cR <cmd>lua vim.lsp.buf.rename()<CR>"
  vim.cmd "noremap <Leader>cI <cmd>lua vim.diagnostic.open_float()<CR>"
  vim.cmd "noremap <Leader>cC :ConjureConnect<CR>"
  vim.cmd "noremap <Leader>ce :ConjureEval<CR>"
  vim.cmd "noremap <Leader>ctt :TestNearest<CR>"
  vim.cmd "noremap <Leader>ctf :TestFile<CR>"
  vim.cmd "noremap <Leader>cts :TestSuite<CR>"
  vim.cmd "noremap <Leader>ctl :TestLast<CR>"

  -- -- Mappings.
  -- -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

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
end
