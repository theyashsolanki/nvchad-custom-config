local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup {
  ui = {
    -- skull icon
    code_action = " 󰚌",
    devicon = true,
  },
  code_action = {
    extend_gitsigns = false,
    enable_in_insert = false,
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
  lightbulb = {
    enable_in_insert = false,
  },
  rename = {
    keys = {
      quit = "<C-c>",
    },
  },
}
