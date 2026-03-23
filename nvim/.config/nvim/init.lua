-- ============================================================
--  init.lua — Neovim config (migrated from vimrc)
-- ============================================================

-- ── Bootstrap lazy.nvim ──────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ── Leader (must be before lazy) ─────────────────────────────
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ── Plugins ───────────────────────────────────────────────────
require("lazy").setup({

  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = { width = 0.85, height = 0.75 },
          previewer = true,
        },
      })
    end },

  -- File tree
  { "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        filters = { dotfiles = false },
        renderer = {
          icons = {
            glyphs = {
              folder = { arrow_open = "▾", arrow_closed = "▸" },
            },
          },
        },
      })
    end },

  -- Status line
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "catppuccin" },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "filetype", "encoding" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end },

  -- Git signs in gutter
  { "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "▎" },
          topdelete    = { text = "▎" },
          changedelete = { text = "▎" },
        },
      })
    end },

  -- Git integration
  "tpope/vim-fugitive",

  -- Surround
  { "kylechui/nvim-surround", config = true },

  -- Auto pairs
  { "windwp/nvim-autopairs", config = true },

  -- Comments
  { "numToStr/Comment.nvim", config = true },

  -- Multiple cursors
  { "mg979/vim-visual-multi", branch = "master" },

  -- Indent guides
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│", highlight = "IblIndent" },
        scope  = { enabled = false },
      })
    end },

  -- Treesitter — parser management (Neovim 0.11+ has built-in highlighting)
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy  = false,
    config = function()
      require("nvim-treesitter").setup()
      -- Install parsers on first run
      vim.schedule(function()
        local install = require("nvim-treesitter.install")
        install.install({
          "lua", "vim", "python", "javascript", "typescript",
          "go", "rust", "java", "kotlin", "bash", "json", "yaml",
          "toml", "markdown", "html", "css",
        })
      end)
    end },

  -- Smooth scrolling
  { "karb94/neoscroll.nvim", config = true },

  -- Start screen
  { "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha  = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file",    ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  Live grep",    ":Telescope live_grep<CR>"),
        dashboard.button("e", "  File tree",    ":NvimTreeToggle<CR>"),
        dashboard.button("q", "  Quit",         ":qa<CR>"),
      }
      alpha.setup(dashboard.config)
    end },

}, {
  ui = { border = "rounded" },
})

-- ============================================================
--  Core options
-- ============================================================
local o = vim.opt

o.encoding    = "utf-8"
o.hidden      = true
o.history     = 1000
o.undofile    = true
o.undodir     = vim.fn.stdpath("data") .. "/undo"
o.updatetime  = 100
o.timeoutlen  = 400

-- UI
o.number         = true
o.relativenumber = true
o.cursorline     = true
o.signcolumn     = "yes"
o.scrolloff      = 8
o.sidescrolloff  = 8
o.showcmd        = true
o.showmode       = false
o.laststatus     = 3
o.termguicolors  = true
o.splitright     = true
o.splitbelow     = true

-- Search
o.ignorecase = true
o.smartcase  = true
o.incsearch  = true
o.hlsearch   = true
o.gdefault   = true

-- Indentation
o.expandtab   = true
o.tabstop     = 4
o.shiftwidth  = 4
o.softtabstop = 4
o.autoindent  = true
o.smartindent = true

-- Whitespace & wrapping
o.wrap      = false
o.backspace = "indent,eol,start"
o.list      = true
o.listchars = { tab = "→ ", trail = "·", extends = ">", precedes = "<" }

-- Clipboard
o.clipboard = "unnamed"

-- Wild menu
o.wildmode   = "longest:full,full"
o.wildignore:append({ "*.o", "*.pyc", "node_modules/**", ".git/**" })

-- Performance
o.lazyredraw = true

-- ============================================================
--  Keymaps
-- ============================================================
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Sanity
map("n", ";",            ":",                          "Command mode")
map("n", "<leader>w",   ":w<CR>",                     "Save")
map("n", "<leader>q",   ":q<CR>",                     "Quit")
map("n", "<leader>x",   ":x<CR>",                     "Save and quit")
map("n", "<leader>Q",   ":q!<CR>",                    "Force quit")

-- Clear search highlight
map("n", "<leader>/",   ":nohlsearch<CR>",             "Clear highlight")

-- Split navigation
map("n", "<C-h>",       "<C-w>h",                     "Move left")
map("n", "<C-j>",       "<C-w>j",                     "Move down")
map("n", "<C-k>",       "<C-w>k",                     "Move up")
map("n", "<C-l>",       "<C-w>l",                     "Move right")

-- Split resize
map("n", "<leader>=",   "<C-w>=",                     "Equal splits")
map("n", "<leader>>",   ":vertical resize +5<CR>",    "Wider")
map("n", "<leader><",   ":vertical resize -5<CR>",    "Narrower")
map("n", "<leader>+",   ":resize +5<CR>",             "Taller")
map("n", "<leader>_",   ":resize -5<CR>",             "Shorter")

-- Buffer navigation
map("n", "<Tab>",       ":bnext<CR>",                 "Next buffer")
map("n", "<S-Tab>",     ":bprev<CR>",                 "Prev buffer")
map("n", "<leader>d",   ":bd<CR>",                    "Delete buffer")

-- Telescope
map("n", "<leader>f",   ":Telescope find_files<CR>",  "Find files")
map("n", "<leader>g",   ":Telescope git_files<CR>",   "Git files")
map("n", "<leader>r",   ":Telescope live_grep<CR>",   "Live grep")
map("n", "<leader>l",   ":Telescope current_buffer_fuzzy_find<CR>", "Lines")
map("n", "<leader>'",   ":Telescope marks<CR>",       "Marks")
map("n", "<leader>b",   ":Telescope buffers<CR>",     "Buffers")

-- nvim-tree
map("n", "<leader>e",   ":NvimTreeToggle<CR>",        "Toggle tree")
map("n", "<leader>E",   ":NvimTreeFindFile<CR>",      "Find in tree")

-- Git (fugitive)
map("n", "<leader>gs",  ":Git<CR>",                   "Git status")
map("n", "<leader>gc",  ":Git commit<CR>",            "Git commit")
map("n", "<leader>gp",  ":Git push<CR>",              "Git push")
map("n", "<leader>gl",  ":Git log --oneline<CR>",     "Git log")
map("n", "<leader>gd",  ":Gdiffsplit<CR>",            "Git diff")
map("n", "<leader>gb",  ":Git blame<CR>",             "Git blame")

-- Quickfix
map("n", "<leader>co",  ":copen<CR>",                 "Open quickfix")
map("n", "<leader>cc",  ":cclose<CR>",                "Close quickfix")
map("n", "[q",          ":cprev<CR>",                 "Prev quickfix")
map("n", "]q",          ":cnext<CR>",                 "Next quickfix")

-- Move lines
map("n", "<M-j>",       ":m .+1<CR>==",              "Move line down")
map("n", "<M-k>",       ":m .-2<CR>==",              "Move line up")
map("v", "<M-j>",       ":m '>+1<CR>gv=gv",          "Move selection down")
map("v", "<M-k>",       ":m '<-2<CR>gv=gv",          "Move selection up")

-- Misc
map("n", "<leader>D",   "yyp",                        "Duplicate line")
map("n", "<leader>a",   "ggVG",                       "Select all")
map("v", "<",           "<gv",                        "Indent left")
map("v", ">",           ">gv",                        "Indent right")

-- Open config
map("n", "<leader>,",   ":e $MYVIMRC<CR>",           "Open config")

-- ============================================================
--  Autocommands
-- ============================================================
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- Strip trailing whitespace on save
au("BufWritePre", {
  group   = ag("strip_whitespace", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Return to last cursor position
au("BufReadPost", {
  group = ag("last_position", { clear = true }),
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Relative numbers only in normal mode
local numgrp = ag("smart_numbers", { clear = true })
au("InsertEnter", { group = numgrp, callback = function() vim.opt.relativenumber = false end })
au("InsertLeave", { group = numgrp, callback = function() vim.opt.relativenumber = true end })

-- Highlight on yank
au("TextYankPost", {
  group = ag("highlight_yank", { clear = true }),
  callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
})
