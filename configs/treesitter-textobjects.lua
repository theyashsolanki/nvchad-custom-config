require("nvim-treesitter.configs").setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

        ["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
        ["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        -- ["]f"] = { query = "@call.outer", desc = "Next function call start" },
        ["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
        -- ["]c"] = { query = "@class.outer", desc = "Next class start" },
        -- ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
        -- ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        -- ["]F"] = { query = "@call.outer", desc = "Next function call end" },
        ["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
        -- ["]C"] = { query = "@class.outer", desc = "Next class end" },
        -- ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
        -- ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
      },
      goto_previous_start = {
        -- ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
        ["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
        -- ["[c"] = { query = "@class.outer", desc = "Prev class start" },
        -- ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
        -- ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
      },
      goto_previous_end = {
        -- ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
        ["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
        -- ["[C"] = { query = "@class.outer", desc = "Prev class end" },
        -- ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
        -- ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
      },
    },
  },
}
