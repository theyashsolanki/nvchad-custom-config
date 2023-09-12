local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "json",
    "bash",
    "python",
    "go",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "tailwindcss-language-server",
    "emmet-ls",
    "eslint-lsp",
    "json-lsp",

    -- shell stuff
    "bash-language-server",
    "shellcheck",
    "beautysh",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "jedi-language-server",
    "mypy",
    "ruff",
    "black",

    -- Golang
    "gopls",
    "gofumpt",
    "goimports_reviser",
  },
  ui = {
    keymaps = {
      apply_language_filter = "F",
    },
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = false,
      },
    },
  },
}

M.nvterm = {
  terminals = {
    shell = "bash.exe",
    type_opts = {
      float = {
        relative = "editor",
        -- row = 0.5,
        -- col = 0.40,
        width = 0.95,
        height = 0.95,
        border = "single",
      },
    },
  },
}

M.blankline = {
  show_current_context = true,
  show_current_context_start = false,
}

M.cmp = {
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

    ["<C-p>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
    ["<C-n>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },
    ["<C-k>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
    ["<C-j>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },
    ["<CR>"] = require("cmp").mapping.confirm { select = false },
    ["<C-e>"] = require("cmp").mapping { i = require("cmp").mapping.abort(), c = require("cmp").mapping.close() },
    ["<Up>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
    ["<Down>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },
    ["<C-Space>"] = require("cmp").mapping(require("cmp").mapping.complete(), { "i", "c" }),
  },
}

return M
