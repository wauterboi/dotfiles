local autocmd = require 'autocmd'
local plugins = require 'plugins'

-- Interface
vim.opt.number      = true
vim.opt.showcmd     = true
vim.opt.cursorline  = true

-- Whitespace
vim.opt.list = true
vim.opt.listchars = {
  eol = '↵',
  tab = '⇶ ',
  trail = '⋯'
}

-- Splits
vim.opt.splitbelow  = true
vim.opt.splitright  = true

-- Margins
vim.opt.colorcolumn = "80,120"

-- Indentation
local function set_indent(vim, expand, size)
  vim.opt.expandtab   = expand
  vim.opt.shiftwidth  = size
  vim.opt.tabstop     = size
end

autocmd:register('BufEnter', function(vim)
  for _, filetype in pairs {'cs', 'Makefile'--[[, 'zscript']]} do
    if vim.bo.filetype == filetype then
      return set_indent(vim, false, 4)
    end
  end
  set_indent(vim, true, 2)
end)

-- Searching
vim.opt.incsearch = true
vim.api.nvim_set_keymap(
  'n',
  '<leader><space>',
  ':nohlsearch<CR>',
  {noremap = true}
)

-- General Quality of Life
vim.opt.clipboard   = 'unnamedplus'
vim.opt.backup      = false

-- Folding
vim.opt.foldmethod  = 'manual'

-- OmniSharp configuration
vim.cmd [[autocmd CursorHold *.cs OmniSharpTypeLookup]]
