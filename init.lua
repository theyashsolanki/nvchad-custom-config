local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.o.scrolloff = 8
vim.o.relativenumber = true
vim.o.foldenable = true -- enable fold for nvim-uf
vim.o.foldlevel = 99 -- set high foldlevel for nvim-uf
vim.o.foldlevelstart = 99 -- start with all code unfolde
-- vim.o.foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil
-- vim.o.iskeyword = "-"
vim.opt.iskeyword:append "-"
