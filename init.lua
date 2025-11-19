local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
    -- Theme
	Plug('folke/tokyonight.nvim')
    -- Auto pairs
    Plug('windwp/nvim-autopairs')
    -- Table mode
    Plug('dhruvasagar/vim-table-mode')
    -- Bibtex Integration
    Plug('nvim-lua/plenary.nvim')
    Plug('nvim-telescope/telescope.nvim')
    Plug('nvim-telescope/telescope-bibtex.nvim')
vim.call('plug#end')


-- Tabs: 4 spaces
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true

-- Core options
vim.o.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.o.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.mousescroll='ver:1,hor:1'

vim.cmd('syntax enable')
vim.opt.termguicolors = true

-- ============================
-- Theme: Tokyo Night (transparent)
-- ============================
-- Configure before applying the colourscheme

local ok_tokyo, tn = pcall(require, "tokyonight")
if ok_tokyo then
  tn.setup({
    transparent = true, -- main toggle
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  })
end

vim.cmd.colorscheme("tokyonight")

-- ============================
-- Auto-close pairs
-- ============================
local ok_pairs, npairs = pcall(require, "nvim-autopairs")
if ok_pairs then
  npairs.setup({})
end


-- ============================
-- Local Functions
-- ============================

function HardWrapText()
  local original_tw = vim.opt.textwidth:get()
  vim.opt.textwidth = 78
  vim.cmd [[normal! gqap]]
  vim.opt.textwidth = original_tw
end

function UnwrapText()
  local original_tw = vim.opt.textwidth:get()
  vim.opt.textwidth = 0

  -- Save current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  -- Select the current paragraph and join lines
  vim.cmd [[normal! vipJ]]

  -- Replace `. ` with `.⏎  ` to add two-space indentation after splitting sentences
  vim.cmd [[normal! gv]]
  vim.cmd [[silent! '<,'>s/\.\s\+/\.\r  /g]]

  -- Restore original textwidth
  vim.opt.textwidth = original_tw

  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)
end

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- TXT, MD and QMD ONLY
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'plaintext', 'markdown', 'quarto' }, -- Match .md and .qmd files
  callback = function()
    vim.wo.colorcolumn = '79'
    vim.opt_local.shiftwidth = 2 -- Set indentation to 2 spaces
    vim.opt_local.tabstop = 2 -- Ensure tabs are 2 spaces wide
    vim.opt_local.spell = true -- Enable spell checking
    vim.opt_local.spelllang = 'en_gb' -- Set spelling to British English
    vim.opt_local.wrap = false
  end,
  desc = 'Set options for Plaintext, Markdown and Quarto files',
})


-- ============================
-- Custom Keymaps
-- ============================

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- File Explorer
vim.keymap.set('n', '<space>fe', ':Ex<CR>', { noremap = true, silent = true, desc = 'Open file explorer' })

-- wrap and unwrap text
vim.keymap.set('n', '<space>tw', HardWrapText, { noremap = true, silent = true })
vim.keymap.set('n', '<space>tu', UnwrapText, { noremap = true, silent = true })

-- table mode
vim.keymap.set('n', '<space>tm', ':TableModeToggle<CR>' , { noremap = true, silent = true})

-- bibtext
vim.keymap.set('n', '<space>bib', ':Telescope bibtex<CR>' , { noremap = true, silent = true})
