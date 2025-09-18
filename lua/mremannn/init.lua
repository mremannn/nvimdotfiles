require("mremannn.lazy")
require("mremannn.lsp")

-- set map leader (kinda redundant but whatever)
vim.g.mapleader = " "

-- number setup
vim.o.number = true
vim.o.relativenumber = true

-- setup / search stuff
vim.o.hlsearch = false
vim.o.incsearch = true

-- prevents from less than 10 lines being off the screen
vim.o.scrolloff = 10

-- proper colour or something
vim.opt.termguicolors = true

-- tab formatting or some shit, idk makes shit look cool
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- disable start splash screen
vim.opt.shortmess:append("I")

-- disable line wrap
vim.o.wrap = false

-- enable undo file
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- the one keymap (shift y yanks to system clipboard)
vim.keymap.set({ "v", "x" }, "Y", '"+y')

-- sets status bar to be transparent
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
