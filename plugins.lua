local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "glepnir/lspsaga.nvim",
        branch = "main",
        event = "LspAttach",
        config = function()
          require "custom.configs.lspsaga"
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
      },
      {
        "jose-elias-alvarez/typescript.nvim",
        config = function()
          require "custom.configs.lspconfig"
        end,
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
    opts = {
      -- preselect = require("cmp").PreselectMode.None,
      experimental = {
        ghost_text = false,
      },
      -- completion = {
      --   completeopt = "menu,menuone,noinsert,noselect",
      -- },
      confirm_opts = {
        behavior = require("cmp").ConfirmBehavior.Replace,
        select = false,
      },
      mapping = {
        -- disable  tab
        ["<Tab>"] = function(callback)
          callback()
        end,

        ["<S-Tab>"] = function(callback)
          callback()
        end,

        ["<C-k>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
        ["<C-j>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },
        ["<CR>"] = require("cmp").mapping.confirm { select = false },
        ["<C-e>"] = require("cmp").mapping { i = require("cmp").mapping.abort(), c = require("cmp").mapping.close() },
        ["<Up>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
        ["<Down>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },
        ["<C-Space>"] = require("cmp").mapping(require("cmp").mapping.complete(), { "i", "c" }),
      },
    },
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    config = function()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      preview = {
        mappings = {
          scrollB = "<C-b>",
          scrollF = "<C-f>",
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          -- ["zR"] = { function() require("ufo").openAllFolds() end, desc = "Open all folds" },
          -- ["zM"] = { function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
          -- ["zr"] = { function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" },
          -- ["zm"] = { function() require("ufo").closeFoldsWith() end, desc = "Fold more" },
          -- ["<leader>zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
        },
      },
      provider_selector = function(_, filetype, buftype)
        local function handleFallbackException(bufnr, err, providerName)
          if type(err) == "string" and err:match "UfoFallbackException" then
            return require("ufo").getFolds(bufnr, providerName)
          else
            return require("promise").reject(err)
          end
        end

        return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
            or function(bufnr)
              return require("ufo")
                  .getFolds(bufnr, "lsp")
                  :catch(function(err)
                    return handleFallbackException(bufnr, err, "treesitter")
                  end)
                  :catch(function(err)
                    return handleFallbackException(bufnr, err, "indent")
                  end)
            end
      end,
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },
  -- Remove the `use` here if you're using folke/lazy.nvim.
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
  

  -- {
  --   "folke/todo-comments.nvim",
  --   requires = "nvim-lua/plenary.nvim",
  --   lazy = false,
  --   config = function()
  --     require("todo-comments").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end,
  -- },

  -- {
  --   "shellRaining/hlchunk.nvim",
  --   lazy = false,
  --   config = function()
  --     require("hlchunk").setup {
  --
  --       blank = {
  --         enable = false,
  --       }
  --     }
  --   end,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false,
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
}

return plugins
