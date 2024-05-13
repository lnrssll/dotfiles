return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = require "configs.treesitter",
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_filetypes = {
        ["markdown"] = false,
      }
    end
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        -- disable  tab
        ["<Tab>"] = function(callback)
          callback()
        end,

        ["<S-Tab>"] = function(callback)
          callback()
        end,
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
