-- https://github.com/nvim-treesitter/nvim-treesitter

local options = require("core.options")

local M = {
    requires = {
        "nvim-treesitter.configs",
        "nvim-treesitter.parsers",
    },
}

function M.download_source_settings()
    local default_source = "https://github.com/"

    if options.download_source ~= default_source then
        for _, config in pairs(M.nvim_treesitter_parsers.get_parser_configs()) do
            config.install_info.url = config.install_info.url:gsub(default_source, options.download_source)
        end
    end
end

function M.before() end

function M.load()
    M.download_source_settings()

    M.nvim_treesitter_configs.setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = { "yaml", "python", "html", "vue" },
        },
        -- incremental selection
        -- incremental_selection = {
        --     enable = false,
        --     keymaps = {
        --         init_selection = "<cr>",
        --         node_incremental = "<cr>",
        --         node_decremental = "<bs>",
        --         scope_incremental = "<tab>",
        --     },
        -- },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true,
            -- Do not enable for files with more than 1000 lines, int
            max_file_lines = 1000,
        },
        -- nvim-ts-autotag
        autotag = {
            enable = true,
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<c-space>",
                node_incremental = "<c-space>",
                scope_incremental = "<c-S>",
                node_decremental = "<backspace>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>xp"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>xP"] = "@parameter.inner",
                },
            },
            lsp_interop = {
                enable = true,
                border = "none",
                peek_definition_code = {
                    ["<leader>pf"] = "@function.outer",
                    ["<leader>pc"] = "@class.outer",
                },
            },
        },
    })
end

function M.after() end

return M
