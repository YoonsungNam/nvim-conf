call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

syntax enable

set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set number
set numberwidth=3
set signcolumn=yes
set modelines=0
set showcmd
set encoding=utf-8
set backspace=indent,eol,start " backspace works on every character in insert mode


:lua << EOF
--nvim-treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",

    sync_install = false,

    highlight = {
        enable = true,
        disable = { "rust" },
        additional_vim_regex_highlighting = false,
        },
    }
EOF

:lua << EOF
--tokyonight.nvim
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.cmd[[colorscheme tokyonight]]
EOF

:lua << EOF
--lualine.nvim
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
EOF


