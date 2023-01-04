-- Theme style
vim.g.material_style = 'oceanic'

-- Colorscheme settings
require('material').setup({
    contrast = {
        sidebars = true,
        floating_windows = false,
        cursor_line = true,
        popup_menu = false,
        filetypes = {
            "qf",
            "packer",
            "dapui_breakpoints",
        }
    },
    plugins = {
       "dap",
       "gitsigns",
       "indent-blankline",
       "neogit",
       "nvim-cmp",
       "nvim-tree",
       "nvim-web-devicons",
       "telescope",
       "which-key",
    },
    styles = {
        comments = { italic = true },
        functions = { italic = true },
    },
    disable = {
        borders = true,
        background = false,
        term_colors = false,
        eob_lines = false
    },
    lualine_style = 'stealth'
})

-- Apply the colorscheme
vim.cmd 'colorscheme material'
