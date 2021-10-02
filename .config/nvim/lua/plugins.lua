local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
    execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]

require("packer").init()

return require("packer").startup(function()
  use { "wbthomason/packer.nvim" }
  use { "editorconfig/editorconfig-vim" }
  use { "christoomey/vim-tmux-navigator" }
  use { "tpope/vim-surround" }
  use { "tpope/vim-endwise" }
  use { "jiangmiao/auto-pairs" }
  use { "easymotion/vim-easymotion" }
  use { "dyng/ctrlsf.vim" }
  use { "airblade/vim-gitgutter" }
  use { "vim-scripts/BufOnly.vim" }
  use { "dense-analysis/ale" }
  use { "jpalardy/vim-slime" }
  use { "MattesGroeger/vim-bookmarks" }
  use { "posva/vim-vue" }
  use { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" }
  use { "junegunn/fzf.vim" }

  -- New things
  -- TODO: replace fugitive by neogit + diffview, probably no need to do that
  use { "tpope/vim-fugitive" }
  -- use { 
  --   "TimUntersberger/neogit", 
  --   requires = "nvim-lua/plenary.nvim",
  -- }
  -- use { 
  --   "sindrets/diffview.nvim",
  -- }  
  use { "hrsh7th/vim-vsnip" }
  use { "akinsho/nvim-bufferline.lua" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "neovim/nvim-lspconfig" }
  use { "hoob3rt/lualine.nvim" }
  use { "kabouzeid/nvim-lspinstall" }
  use { "hrsh7th/nvim-compe" }
  -- use {
  --   "nvim-telescope/telescope.nvim",
  --   requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  -- }
  use { "folke/which-key.nvim" }
  use{ "gregsexton/MatchTag" }

  -- Themes
 
  use { "morhetz/gruvbox" }
  use { "cocopon/iceberg.vim" }
  use { "rakr/vim-one" }
  use { "arcticicestudio/nord-vim" }
  use { "pineapplegiant/spaceduck" }
  use { "tomasiser/vim-code-dark" }
  use { "dracula/vim" }
  use { "crusoexia/vim-monokai" }


  -- Plugins configuration


  local lspconfig = require("lspconfig")
  local lspinstall = require("lspinstall")

  lspinstall.setup()

  local servers = lspinstall.installed_servers()
  
  for _, server in pairs(servers) do
    lspconfig[server].setup{}
  end

  require("compe").setup({
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = "enable";
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
      border = { "", "" ,"", " ", "", "", "", " " }, -- the border option is the same as `|help nvim_open_win|`
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 120,
      min_width = 60,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1,
    };

    source = {
      path = true;
      buffer = true;
      calc = false;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
      ultisnips = true;
      luasnip = true;
    }
  })

  vim.g.nvim_tree_gitignore = 1
  vim.g.nvim_tree_ignore = { ".git", "node_modules", ".idea", ".vscode", ".DS_Store" }
  vim.g.nvim_tree_icons = {
    default = '',
  }
  vim.g.nvim_tree_show_icons = {
    folders = 0,
    files = 0,
    git = 0,
    folder_arrows = 0,
  }

  require("nvim-tree").setup({
    update_focused_file = {
      enable = 1,
    },
    view = {
      width = 50,
      auto_resize = 1,
    },
  })

  require("lualine").setup({
    options = {
      theme = "nord";
    };
  })

  -- require("nvim-autopairs").setup()

  require("bufferline").setup({
    options = {
      show_buffer_icons = false;
      show_buffer_close_icons = false;
      show_close_icon = false;
      enforce_regular_tabs = true;
    };
  })

  -- require("neogit").setup({
  --   integrations = {
  --     diffview = true;   
  --   },
  -- })

  -- require("diffview").setup()
  -- vim.cmd [[
  --   function! s:find_git_root()
  --     return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  --   endfunction
  -- ]]
end)
