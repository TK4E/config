local bar_fg = "#1d2021"

require"bufferline".setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        indicator_icon = '▎',
        view = "default",
        numbers = "both",
        buffer_close_icon = "x",
        modified_icon = "●",
        close_icon = "X",
        left_trunc_marker = "...",
        right_trunc_marker = "...",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 8,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "superscript",
        mappings = "true",
        diagnostics = "nvim_lsp"
    },
    -- bar colors!!
    highlights = {
        fill = {guifg = bar_fg, guibg = bar_fg},
        background = {guifg = '#a89984', guibg = '#1d2021'},
        -- buffer
        buffer_selected = {
            guifg = '#b8bb26',
            guibg = '#383838',
            gui = "bold"
        },
        buffer_visible = {guifg = "#9298a0", guibg = bar_fg},
        -- tabs over right
        tab = {guifg = "#9298a0", guibg = "#30343c"},
        tab_selected = {guifg = "#30343c", guibg = "#9298a0"},
        tab_close = {guifg = "#f9929b", guibg = bar_fg},
        -- buffer separators
        separator = {guifg = bar_fg, guibg = "#282828"},
        separator_selected = {guifg = "#1e222a", guibg = "#1e222a"},
        separator_visible = {guifg = bar_fg, guibg = "#282828"},
        indicator_selected = {guifg = bar_fg, guibg = "#282828"},
        -- modified files (but not saved)
        modified_selected = {guifg = "#A3BE8C", guibg = "#1e222a"},
        modified_visible = {guifg = "#BF616A", guibg = "#23272f"}
    }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- MAPPINGS
map("n", "<A-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<A-T>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
--map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
--map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
