local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup {
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-j>", scroll_up = "<C-k>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
    split = "<C-h>",
    vsplit = "<C-s>",
  },
  -- disable lightbulb
  lightbulb = {
    enable_in_insert = false,
  },
  finder = {
    keys = {
      expand_or_jump = "<CR>",
      split = "<C-h>",
      vsplit = "<C-s>",
    },
  },
  outline = {
    keys = {
      expand_or_jump = "<CR>",
    },
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
  },
}