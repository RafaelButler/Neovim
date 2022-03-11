
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-o>", ":only<CR>", opts)

-- Split windows
keymap("n", "<A-v>", ":vsplit<CR>", opts)
keymap("n", "<A-s>", ":split<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--Close windows
keymap("n", "<C-w>", ":bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )

--Teste
keymap("n", ",l", "v:vsplit .<CR>", {expr = true, noremap = true})

-- NvimTree --
-- Command NvimTree
keymap("n", "<A-e>", ":NERDTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts);
keymap("n", "<C-i>", ":Telescope live_grep<CR>", opts);
keymap("n", "SW", ":Telescope grep_string search=", opts);
keymap("n", "<C-b>", ":Telescope buffers<CR>", opts);
keymap("n", "<C-f>", ":Telescope git_files theme=dropdown<CR>", opts);
keymap("n", "<space>d", ":Telescope diagnostic<CR>", opts);
keymap("n", "gcs", ":Telescope git_commits<CR>", opts);
keymap("n", "<A-h>", ":Telescope help_tags<CR>", opts);

--Tabs
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts);
keymap("n", "<S-tab>", ":BufferLineCyclePrev<CR>", opts);

-- LSP--
-- LSP Keymaps --
keymap("n", '<space>n', ':lua vim.lsp.buf.rename()<CR>', opts)
keymap("n", 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
keymap("n", ',l', ':lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<C-x>', ':lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<C-s>', ':lua vim.lsp.buf.formatting()<CR>', opts)

-- Fugitive
-- Fugitive maps--
keymap('n', 'qp', ':Git commit<CR>', opts)
keymap('n', 'qb', ':Git branch<CR>', opts)
keymap('n', 'gs', ':Git status<CR>', opts)
keymap('n', 'qd', ':Gvdiff<CR>', opts)
keymap('n', 'ga', ':Git add .<CR>', opts)
keymap('n', '<A-b>', ':G<CR>', opts)
keymap('n', 'çj', ':diffget //3<CR>', opts)
keymap('n', 'çk', ':diffget //2<CR>', opts)
keymap('n', '<A-b>', ':G<CR>', opts)

--LazyGit--
keymap('n', 'lg', ':LazyGit<CR>', opts)

-- Config file
keymap("n", "<C-A>", ":e ~/.config/nvim/<CR>", opts)
keymap("n", "<C-C>", ":Telescope find_files cwd=~/.config/nvim/<CR>", opts)

--Trouble
keymap("n", "çl", ":TroubleToggle<CR>", opts)

-- Source file
keymap("n", "tt", ":source ~/.config/nvim/init.lua<CR>", opts)

--Prettier
keymap("n", "<space>p", ":Prettier<CR>", opts)

--Lua:
keymap('n', '<space>m', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], opts)

--keymap("n", 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
--keymap("n", 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
--keymap("n", 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
--keymap("n", 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
--keymap("n", 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
--keymap("n", 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
--keymap("n", 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
--keymap("n", 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
--keymap("n", '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
--keymap("n", '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
--keymap("n", '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
