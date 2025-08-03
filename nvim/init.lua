local opt = vim.opt

-- options
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noinsert", "fuzzy" }
opt.hlsearch = false
opt.ignorecase = true
opt.iskeyword:append("-")
opt.linebreak = true
opt.number = true
opt.path:append("**")
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 10
opt.shiftwidth = 4
opt.sidescrolloff = 10
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undofile = true
opt.undolevels = 100000
opt.wildignore:append({ "*/.git/*" })

local g = vim.g

-- disable providers
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

-- netrw settings
g.netrw_banner = 0
g.netrw_fastbrowse = 0

-- set leader key
g.mapleader = ","

local map = vim.keymap.set

-- keymaps
map({ "n", "v" }, "j", [[v:count?'j':'gj']], { expr = true })
map({ "n", "v" }, "k", [[v:count?'k':'gk']], { expr = true })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "<leader>e", require("explorer").toggle, { desc = "Toggle explore" })

local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})
