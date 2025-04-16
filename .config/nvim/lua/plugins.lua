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
  use { "tpope/vim-surround" }
  use { "tpope/vim-endwise" }
  use { "jiangmiao/auto-pairs" }

  if (vim.g.vscode) then
    use { "asvetliakov/vim-easymotion", as = "vsc-easymotion" }
  end

  if not (vim.g.vscode) then
    use { "easymotion/vim-easymotion" }
    use { "editorconfig/editorconfig-vim" }
    use { "christoomey/vim-tmux-navigator" }
    use { "dyng/ctrlsf.vim" }
    -- use { "mhinz/vim-signify" }
    use { "airblade/vim-gitgutter" }
    use { "vim-scripts/BufOnly.vim" }
    use { "dense-analysis/ale" }
    use { "jpalardy/vim-slime" }
    use { "MattesGroeger/vim-bookmarks" }
    use { "posva/vim-vue" }
    use { "evanleck/vim-svelte" }
    use { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }
    use { "vim-test/vim-test" }
    use { "cocopon/colorswatch.vim" }
    use { "lilydjwg/colorizer" }
    use { "cocopon/inspecthi.vim" }
    use { "jremmen/vim-ripgrep", run = "cargo install --locked ripgrep" }
    use { "jxnblk/vim-mdx-js" }
    use { "slim-template/vim-slim" }
    use { "Olical/conjure" }
    use { "tpope/vim-fugitive" }
    use { "sindrets/diffview.nvim", requires = 'nvim-lua/plenary.nvim' }
    use { "kyazdani42/nvim-tree.lua" }
    -- use { "nvim-treesitter/nvim-treesitter", run = "cargo install --locked tree-sitter-cli" }
    use { "neovim/nvim-lspconfig" }
    use { "nvim-lualine/lualine.nvim" }
    use { "hrsh7th/nvim-cmp" }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { "folke/which-key.nvim" }
    use { "cakebaker/scss-syntax.vim" }
    use { "hail2u/vim-css3-syntax" }
    use { "tomlion/vim-solidity" }
    use { "digitaltoad/vim-pug" }
    use { "gregsexton/MatchTag" }
    use { "RRethy/vim-illuminate" }
    use { "folke/zen-mode.nvim" }
    use { "mustache/vim-mustache-handlebars" }
    -- Themes
    use { "cocopon/iceberg.vim" }
    use { "sainnhe/everforest" }
    use { "projekt0n/github-nvim-theme" }
    use { "lifepillar/vim-gruvbox8" }
    use { "lifepillar/vim-solarized8" }
    use { "gbprod/nord.nvim" }
    use { "Mofiqul/vscode.nvim" }
    use { "p00f/alabaster.nvim" }
    use { "navarasu/onedark.nvim" }
    use { "catppuccin/nvim" }
    use { "loctvl842/monokai-pro.nvim" }

    local lspconfig = require("lspconfig")

    lspconfig.rust_analyzer.setup {}
    lspconfig.ts_ls.setup {}
    lspconfig.svelte.setup {}

    local cmp = require'cmp'

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),

      sources = cmp.config.sources(
      {
        { name = "nvim_lsp" }
      },
      {
        { name = "buffer" },
        { name = "path" }
      }
      )
    })

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      disable_netrw = true,
      view = {
        width = 50,
        side = 'left',
      },
      renderer = {
        icons = {
          show = {
            folder = false,
            file = false,
            git = false,
            folder_arrow = true,
          },
	        glyphs = {
            folder = {
              arrow_closed = "+",
              arrow_open = "-"
            }
	        }
        }
      },
      update_focused_file = {
        enable = true,
      },
    })

    require("lualine").setup({
      options = {
        theme = "auto";
        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {{'branch', icon = nil, icons_enabled = false}, {'diff', icon = nil, icons_enabled = false}},
        lualine_c = {'filename'},
        lualine_x = {{'diagnostics', symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}}, 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {},
      },
    })

    -- require("nvim-treesitter.configs").setup({
    --   auto_install = true,
    --   highlight = {
    --     enable = true
    --   }
    -- })

    require("zen-mode").setup({
      window = {
        width = .50,
      },
    })

    -- require("diffview").setup()

    -- slime
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = {
      socket_name = 'default';
      target_pane = '{last}';
    }

    -- ctrlsf
    vim.g.ctrlsf_auto_preview = 0
    vim.g.ctrlsf_confirm_save = 0
    vim.g.ctrlsf_ackprg = 'rg'
    vim.g.ctrlsf_default_root = 'project'

    -- gitgutter
    vim.g.gitgutter_sign_added = "▌"
    vim.g.gitgutter_sign_modified = "▌"
    vim.g.gitgutter_sign_removed = "▌"
    vim.g.gitgutter_sign_removed_first_line = "▌"
    vim.g.gitgutter_sign_removed_above_and_below = "▌"
    vim.g.gitgutter_sign_modified_removed = "▌"

    -- ALE
    vim.g.ale_linters = {
      ruby = { "rubocop" };
      vue = { "eslint" };
      svelte = { "eslint" };
      javascript = { "eslint" };
      javascriptreact = { "eslint" };
      typescript = { "eslint" };
      typescriptreact = { "eslint" };
      sass = { "stylelint" };
      scss = { "stylelint" };
      css = { "stylelint" };
      markdown = { "yaspeller" };
      clojure = { "clj-kondo" };
      json = {};
      rust = { "rustc" };
    }
    vim.g.ale_fixers = {
      ["*"] = { "trim_whitespace" };
      markdown = { "prettier", "trim_whitespace" };
      svg = { "prettier" };
      html = { "prettier" };
      json = { "prettier" };
      vue = { "eslint", "stylelint" };
      svelte = { "eslint", "stylelint" };
      javascript = { "eslint", "prettier" };
      javascriptreact = { "eslint", "prettier" };
      typescript = { "eslint", "prettier" };
      typescriptreact = { "eslint", "prettier" };
      clojure = { "clj-kondo" };
      sass = { "prettier", "stylelint" };
      scss = { "prettier", "stylelint" };
      css = { "prettier", "stylelint" };
      ruby = { "rubocop" };
      rust = { "rustc" };
    }
    vim.g.ale_fix_on_save = 0
  end
end)
