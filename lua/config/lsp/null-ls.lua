-- https://github.com/jose-elias-alvarez/null-ls.nvim

---@diagnostic disable: unused-local
local api = require("utils.api")
local options = require("core.options")

local M = {
    requires = {
        "null-ls",
    },
}

function M.before() end

function M.load()
    -- add zsh filetype to shfmt
    table.insert(M.null_ls.builtins.formatting.shfmt.filetypes, "zsh")

    M.null_ls.setup({
        border = options.float_border and "double" or "none",
        sources = {
            -- M.null_ls.builtins.formatting.gofmt,
            M.null_ls.builtins.formatting.shfmt,
            M.null_ls.builtins.formatting.prettierd.with({
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars"}
            }),
            M.null_ls.builtins.formatting.blade_formatter,
            M.null_ls.builtins.formatting.phpcsfixer,
            M.null_ls.builtins.formatting.autopep8,
            M.null_ls.builtins.formatting.djlint,
            M.null_ls.builtins.formatting.sql_formatter,
            M.null_ls.builtins.formatting.stylua.with({
                extra_args = {
                    "--indent-type=Spaces",
                    "--indent-width=4",
                },
            }),
            -- M.null_ls.builtins.diagnostics.pylint.with({
            --     extra_args = {
            --         "-f",
            --         "json",
            --         "--load-plugins=pylint_django",
            --         "--disable=django-not-configured",
            --         "--rcfile=" .. api.path.join(options.lint_directory, "pylint.conf"),
            --     },
            -- }),
        },
    })
end

function M.after() end

return M
