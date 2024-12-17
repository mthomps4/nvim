-- quick normal mode
vim.keymap.set({ "i", "v" }, "jk", "<ESC>", { silent = true })

-- fat finger
vim.keymap.set("c", "WQ", "wq")
vim.keymap.set("c", "Wq", "wq")
vim.keymap.set("c", "wQ", "wq")
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("c", "Q!", "q!")
-- options
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"

-- backspace keeps going up a line
vim.opt.backspace = "indent,eol,start"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- formatting
vim.g.format_on_save = true
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax", "onedark" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
