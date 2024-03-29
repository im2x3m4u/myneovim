-- https://github.com/neovim/nvim-lspconfig

local api = require("utils.api")
local aux_lspconfig = require("utils.aux.lspconfig")
-- local lspconfig_configs = require("lspconfig.configs")

local M = {
    requires = {
        "lspconfig",
        "nvim-navic",
        "mason-lspconfig",
    },
}

function M.before()
    M.register_key()
end

function M.dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. M.dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end

function M.load()
    aux_lspconfig.entry()

    local lspconfig_configs = require'lspconfig.configs'
    local configurations_dir_path = "config/lsp/server_configurations/"
    local servers = M.mason_lspconfig.get_installed_servers()
    table.insert(servers, "volar_api")
    table.insert(servers, "volar_doc")
    table.insert(servers, "volar_html")
    -- local volar_api = require('config/lsp/server_configurations/volar_api')
    -- local lspconfig_configs = require'lspconfig.configs'
    -- lspconfig_configs.volar_api= volar_api
    -- lspconfig_configs.volar_api.setup{}

    for _, server_name in ipairs(servers) do
        local require_path = string.format("%s%s", configurations_dir_path, server_name)

        local ok, settings = pcall(require, require_path)

        if not ok then
            settings = {}
        end

        settings.capabilities = aux_lspconfig.get_capabilities()
        settings.handlers = aux_lspconfig.get_headlers(settings)

        settings.on_attach = function(client, bufnr)
            M.nvim_navic.attach(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            -- close semantic tokens
            client.server_capabilities.semanticTokensProvider = nil
        end

        if server_name == "volar_api" or server_name == "volar_doc" or server_name == "volar_html" then
            lspconfig_configs[server_name]=settings
            lspconfig_configs[server_name].setup{}
        else
            M.lspconfig[server_name].setup(settings)
        end
    end
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>h",
            rhs = vim.lsp.buf.hover,
            options = { silent = true },
            description = "Show hover",
        },
        {
            mode = { "n" },
            lhs = "<leader>ca",
            rhs = vim.lsp.buf.code_action,
            options = { silent = true },
            description = "Show code action",
        },
        {
            mode = { "n" },
            lhs = "<leader>cn",
            rhs = vim.lsp.buf.rename,
            options = { silent = true },
            description = "Variable renaming",
        },
        {
            mode = { "n" },
            lhs = "<leader>cf",
            rhs = function()
                vim.lsp.buf.format({ async = true })
            end,
            options = { silent = true },
            description = "Format buffer",
        },
        {
            mode = { "n" },
            lhs = "gh",
            rhs = vim.lsp.buf.hover,
            options = { silent = true },
            description = "Show help information",
        },
        {
            mode = { "n" },
            lhs = "gr",
            rhs = function()
                require("telescope.builtin").lsp_references()
            end,
            options = { silent = true },
            description = "Go to references",
        },
        {
            mode = { "n" },
            lhs = "gi",
            rhs = function()
                require("telescope.builtin").lsp_implementations()
            end,
            options = { silent = true },

            description = "Go to implementations",
        },
        {
            mode = { "n" },
            lhs = "gd",
            rhs = function()
                require("telescope.builtin").lsp_definitions()
            end,
            options = { silent = true },
            description = "Go to definitions",
        },
        {
            mode = { "n" },
            lhs = "<leader>D",
            rhs = function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            options = { silent = true },
            description = "Go to type definitions",
        },
        {
            mode = { "n" },
            lhs = "gD",
            rhs = vim.lsp.buf.declaration,
            options = { silent = true },
            description = "Go to declaration",
        },
        {
            mode = { "n" },
            lhs = "go",
            rhs = aux_lspconfig.diagnostic_open_float,
            options = { silent = true },
            description = "Show Current Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "gO",
            rhs = function()
                require("telescope.builtin").diagnostics()
            end,
            options = { silent = true },
            description = "Show Workspace Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "[g",
            rhs = aux_lspconfig.goto_prev_diagnostic,
            options = { silent = true },
            description = "Jump to prev diagnostic",
        },
        {
            mode = { "n" },
            lhs = "]g",
            rhs = aux_lspconfig.goto_next_diagnostic,
            options = { silent = true },
            description = "Jump to next diagnostic",
        },
        {
            mode = { "i" },
            lhs = "<c-j>",
            rhs = aux_lspconfig.sigature_help,
            options = { silent = true },
            description = "Toggle signature help",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-b>",
            rhs = aux_lspconfig.scroll_to_up,
            options = { silent = true },
            description = "Scroll up floating window",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-f>",
            rhs = aux_lspconfig.scroll_to_down,
            options = { silent = true },
            description = "Scroll down floating window",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-]>",
            rhs = aux_lspconfig.focus_float_window(),
            options = { silent = true },
            description = "Focus floating window",
        },
    })
end

return M
