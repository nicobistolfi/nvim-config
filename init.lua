vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- MDX Filetypes
vim.filetype.add({
  extension = {
    mdx = 'mdx'
  }
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Move selected code up/down with Ctrl+j/k in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Map Option+Backspace to delete entire word in insert mode
-- On macOS, Option+Backspace sends a special character sequence
vim.api.nvim_set_keymap('i', '<M-BS>', '<C-w>', { noremap = true })


-- CodeCompanion
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

-- Insert mode: Ctrl+u for undo, Ctrl+r for redo
vim.api.nvim_set_keymap('i', '<C-u>', '<Esc>ui', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-r>', '<Esc><C-ri>', { noremap = true, silent = true })


-- Sesssion management for project
vim.api.nvim_set_keymap('n', '<leader>ss', ':mksession! ./vim-session.vim<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sr', ':source ./vim-session.vim<CR>', { noremap = true })



