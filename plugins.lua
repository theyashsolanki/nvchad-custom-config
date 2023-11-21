local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "stevearc/conform.nvim",
        config = function()
          require("conform").setup {
            formatters_by_ft = {
              lua = { "stylua" },
              -- Conform will run multiple formatters sequentially
              python = { "isort", "black" },
              -- Use a sub-list to run only the first available formatter
              javascript = { "deno_fmt" },
              typescript = { "deno_fmt" },
              typescriptreact = { "prettier" },
              javascriptreact = { "prettier" },
              json = { "prettier" },
              yaml = { "prettier" },
              html = { "htmlbeautifier", "rustywind" },
              css = { "prettier" },
              markdown = { "prettier" },
              graphql = { "prettier" },
              cpp = { "clang-format" },
              go = { "goimports-reviser", "gofumpt" },
            },
            format_on_save = {
              -- These options will be passed to conform.format()
              timeout_ms = 500,
              lsp_fallback = true,
            },

            vim.keymap.set({ "n", "v" }, "<leader>fm", function()
              require("conform").format()
            end),
          }
        end,
      },

      {
        "nvim-tree/nvim-web-devicons",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "JoosepAlviste/nvim-ts-context-commentstring", ft = "javascriptreact" },
      "windwp/nvim-ts-autotag",
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
          require "custom.configs.treesitter-textobjects"
        end,
      },
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "mbbill/undotree",
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  {
    "kevinhwang91/nvim-ufo",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = { "kevinhwang91/promise-async" },
    opts = overrides.ufo,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    lazy = false,
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-[>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, noremap = true })
      vim.keymap.set("i", "<c-]>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, noremap = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, noremap = true })
    end,
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      require "custom.configs.illuminate"
    end,
  },

  {
    "mrjones2014/smart-splits.nvim",
    -- version = "^1",
    -- optional = true,
    config = function()
      require("smart-splits").setup()
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },

  -- {
  --   "tpope/vim-obsession",
  --   lazy = false,
  -- },

  --  dap stuff here
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          require("core.utils").load_mappings "dap"
          require "custom.configs.nvim-dap"
        end,
      },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterWhite",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "vimwiki/vimwiki",
    lazy = false,
    config = function() end,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = function()
      require("lspsaga").setup {
        hover = {
          open_link = "<CR>",
          open_cmd = "!firefox",
        },
        lightbulb = {
          enable = false,
          -- enable_in_insert = false,
        },
        rename = {
          keys = {
            quit = "<C-c>",
          },
        },
        finder = {
          default = "ref",
        },
      }
    end,
  },
}

return plugins
