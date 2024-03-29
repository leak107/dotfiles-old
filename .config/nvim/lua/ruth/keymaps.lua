local opts  = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap comma as leader key
keymap('', ',', '<Nop>', opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Modes
--  normal_mode = 'n',
--  insert_mode = 'i',
--  visual_mode = 'v',
--  visual_block_mode = 'x',
--  term_mode = 't',
--  command_code = 'c',

-- Normal --
-- Bettwer window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<C-t>', ':NvimTreeToggle<CR>', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Source nvim keymap
keymap('n', '<Leader>lr', ':luafile %<CR>', opts) -- Lua re-source

-- Edit nvim config
keymap('n', '<Leader>ev', ':tabedit ~/.config/nvim/init.lua<CR>', opts)

-- Navigate tabs
keymap('n', '<S-h>', 'gT<CR>', opts)
keymap('n', '<S-l>', 'gt<CR>', opts)

-- keymap('n', '<S-h>', ':bprev<CR>', opts)
-- keymap('n', '<S-l>', ':bnext<CR>', opts)

-- Bufferline navigation
keymap('n', '[b', ':BufferLineCycleNext<CR>', opts)
keymap('n', 'b]', ':BufferLineCyclePrev<CR>', opts)

-- Visual
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+0<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope 
keymap("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- For searching git ignored files
keymap("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').find_files{no_ignore = true, hidden = true}<CR>", opts)
keymap("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
-- keymap("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<Leader>fc", "<cmd>lua require('telescope.builtin').colorscheme()<CR>", opts)

-- Toggle Document Color
keymap('n', '<Leader>tc', "<cmd>lua require('document-color').buf_toggle()<CR>", opts)

keymap('i', '<C-c>', "<Esc>", opts)
