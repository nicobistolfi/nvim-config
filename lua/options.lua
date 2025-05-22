require "nvchad.options"

-- add yours here!

local o = vim.o

-- Font configuration
o.guifont = "FiraCode Nerd Font:h14"

-- Enable ligatures support
if vim.g.neovide then
  vim.g.neovide_font_ligatures = true
end

-- o.cursorlineopt ='both' -- to enable cursorline!
