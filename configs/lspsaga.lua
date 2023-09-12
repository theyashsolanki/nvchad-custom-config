local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup {
  ui = {
    -- skull icon
    code_action = " 󰚌",
  },
  code_action = {
    extend_gitsigns = false,
  },
  callhierarchy = {
    layout = "float",
  },
  outline = {
    -- layout = "float",
    keys = {
      toggle_or_jump = "<CR>",
    },
  },
  rename = {
    keys = {
      quit = "<C-c>",
    },
  },
}
