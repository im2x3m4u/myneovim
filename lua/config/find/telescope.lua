-- https://github.com/nvim-telescope/telescope.nvim

local api = require("utils.api")

local M = {
    requires = {
        "telescope",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.telescope.setup({
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            entry_prefix = " ",
            multi_icon = " ",
            color_devicons = true,
            file_ignore_patterns = { "node_modules", "bundle.js", "bundle.css", "min.js", "min.css" },
            -- theme
            layout_strategy = "bottom_pane",
            -- config
            layout_config = {
                bottom_pane = {
                    height = 15,
                    preview_cutoff = 100,
                    prompt_position = "bottom",
                },
            },
        },
        highlights = {
            -- set highlights for all themes
            -- use a function override to let us use lua to retrieve colors from highlight group
            -- there is no default table so we don't need to put a parameter for this function
            init = function()
                local get_hlgroup = require("astronvim.utils").get_hlgroup
                -- get highlights from highlight groups
                local normal = get_hlgroup("Normal")
                local fg, bg = normal.fg, normal.bg
                local bg_alt = get_hlgroup("Visual").bg
                local green = get_hlgroup("String").fg
                local red = get_hlgroup("Error").fg
                -- return a table of highlights for telescope based on colors gotten from highlight groups
                return {
                    TelescopeBorder = { fg = bg_alt, bg = bg },
                    TelescopeNormal = { bg = bg },
                    TelescopePreviewBorder = { fg = bg, bg = bg },
                    TelescopePreviewNormal = { bg = bg },
                    TelescopePreviewTitle = { fg = bg, bg = green },
                    TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
                    TelescopePromptNormal = { fg = fg, bg = bg_alt },
                    TelescopePromptPrefix = { fg = red, bg = bg_alt },
                    TelescopePromptTitle = { fg = bg, bg = red },
                    TelescopeResultsBorder = { fg = bg, bg = bg },
                    TelescopeResultsNormal = { bg = bg },
                    TelescopeResultsTitle = { fg = bg, bg = bg },
                }
            end,
        },
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    },
                    n = {
                        ["dd"] = "delete_buffer",
                    },
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    })
end

function M.after()
    M.telescope.load_extension("fzf")

    -- FIX: https://github.com/nvim-telescope/telescope.nvim/issues/699
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*" },
        command = "normal zx",
    })
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>ff",
            rhs = function()
                require("telescope.builtin").find_files()
            end,
            options = { silent = true },
            description = "Find files in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fg",
            rhs = function()
                require("telescope.builtin").live_grep()
            end,
            options = { silent = true },
            description = "Find string in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fo",
            rhs = function()
                require("telescope.builtin").oldfiles()
            end,
            options = { silent = true },
            description = "Find telescope history",
        },
        {
            mode = { "n" },
            lhs = "<leader>fh",
            rhs = function()
                require("telescope.builtin").resume()
            end,
            options = { silent = true },
            description = "Find last lookup",
        },
        {
            mode = { "n" },
            lhs = "<leader>ft",
            rhs = function()
                require("telescope.builtin").help_tags()
            end,
            options = { silent = true },
            description = "Find all help document tags",
        },
        {
            mode = { "n" },
            lhs = "<leader>fm",
            rhs = function()
                require("telescope.builtin").marks()
            end,
            options = { silent = true },
            description = "Find marks in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fi",
            rhs = function()
                require("telescope.builtin").highlights()
            end,
            options = { silent = true },
            description = "Find all neovim highlights",
        },
        {
            mode = { "n" },
            lhs = "<leader>fb",
            rhs = function()
                require("telescope.builtin").buffers()
            end,
            options = { silent = true },
            description = "Find all buffers",
        },
        {
            mode = { "n" },
            lhs = "<leader>f/",
            rhs = function()
                require("telescope.builtin").search_history()
            end,
            options = { silent = true },
            description = "Find all search history",
        },
        {
            mode = { "n" },
            lhs = "<leader>f:",
            rhs = function()
                require("telescope.builtin").command_history()
            end,
            options = { silent = true },
            description = "Find all command history",
        },
    })
end

return M
