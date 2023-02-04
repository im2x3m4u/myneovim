local api = require("utils.api")

local M = {
    requires = {
        "colorscheme-persist",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.colorscheme_persist.setup()
    local colorscheme = M.colorscheme_persist.get_colorscheme()
    -- Set colorscheme
    vim.cmd("colorscheme " .. colorscheme)
end

function M.after() end

function M.register_key()
    api.map.register({
            mode = { "n" },
            lhs = "<c-t>",
            rhs = function()
                M.colorscheme_persist.picker()
            end,
            options = { silent = true },
            description = "Colorscheme Picker",
    })
end

return M
