local o = vim.opt

o.termguicolors = true
o.background = "dark"
o.clipboard:append("unnamedplus")

o.number = true
o.relativenumber = true
o.signcolumn = "yes"

o.fillchars:append({ eob = " " })
o.cursorline = false

o.laststatus = 3
o.cmdheight = 0
o.showmode = false
