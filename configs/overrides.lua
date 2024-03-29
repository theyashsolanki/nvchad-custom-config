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

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
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
    -- "eslint-lsp",
    "json-lsp",

    -- shell stuff
    "bash-language-server",
    "shellcheck",
    "beautysh",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "pyright",
    "black",
    "isort",

    -- Golang
    "gopls",
    "gofumpt",
    "goimports-reviser",
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

M.ufo = {
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
}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        -- ["<C-u>"] = require("telescope.actions").results_scrolling_up,
        -- ["<C-d>"] = require("telescope.actions").results_scrolling_down,
      },
    },
  },
}
return M
