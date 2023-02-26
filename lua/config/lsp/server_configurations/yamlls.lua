-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

return {
    single_file_support = true,
    filetypes = { "yaml", "yaml.docker-compose", "yml" },
    cmd = { "yaml-language-server", "--stdio" },
    root_dir = util.find_git_ancestor,
    settings = {
      -- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
        redhat = { telemetry = { enabled = false } },
        yaml = {
            schemas = {
                -- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://squidfunk.github.io/mkdocs-material/schema.json"] = "mkdocs.yml"
            },
        },
    },
}
