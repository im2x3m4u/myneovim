local M = {
    requires = {
        "nvim-tmux-navigation",
    },
}

function M.before() end

function M.load()
    M.nvim_tmux_navigation.setup({
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
            left = "<C-h>",
            down = "<C-j>",
            up = "<C-k>",
            right = "<C-l>",
            last_active = "<C-\\>",
            next = "<C-Space>",
        }
    })
end

function M.after() end

return M
