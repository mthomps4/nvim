-- quick normal mode
vim.keymap.set({ "i", "v" }, "jk", "<ESC>", { silent = true })
-- fat finger
vim.keymap.set("c", "WQ", "wq")
vim.keymap.set("c", "Wq", "wq")
vim.keymap.set("c", "wQ", "wq")
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("c", "Q!", "q!")
-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
-- options
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.backspace = "indent,eol,start"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.foldlevel = 99
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- formatting
vim.g.autoformat = true
vim.g.snacks_animate = false
vim.g.format_on_save = true
vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.lsp.buf.format then
      vim.lsp.buf.format({ async = false }) -- ensure file is finished formatting before saving
    end
  end,
})

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
