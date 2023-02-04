local api = require("utils.api")

local mapping = {}

api.map.bulk_register({
    {
        mode = { "n" },
        lhs = "<leader><esc>",
        rhs = ":qa!<cr>",
        options = { silent = true },
        description = "Escape Neovim",
    },
    {
        mode = { "i" },
        lhs = "jj",
        rhs = "<esc>",
        options = { silent = true },
        description = "Escape editor insert mode",
    },
    {
        mode = { "t" },
        lhs = "<esc>",
        rhs = "<c-\\><c-n>",
        options = { silent = true },
        description = "Escape terminal insert mode",
    },
    {
        mode = { "n" },
        lhs = "<esc>",
        rhs = ":noh<cr>",
        options = { silent = true },
        description = "Clear search highlight",
    },
    {
        mode = { "n" },
        lhs = "<c-u>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "k")
        end,
        options = { silent = true },
        description = "Move 1/4 screen up",
    },
    {
        mode = { "n" },
        lhs = "<c-d>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "j")
        end,
        options = { silent = true },
        description = "Move 1/4 screen down",
    },
    {
        mode = { "n" },
        lhs = "<m-k>",
        rhs = "<c-w>-",
        options = { silent = true },
        description = "Reduce horizontal split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-j>",
        rhs = "<c-w>+",
        options = { silent = true },
        description = "Increase horizontal split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-h>",
        rhs = "<c-w><",
        options = { silent = true },
        description = "Reduce vertical split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-l>",
        rhs = "<c-w>>",
        options = { silent = true },
        description = "Increase vertical split screen size",
    },
    {
        mode = { "n" },
        lhs = "<leader>cs",
        rhs = "<cmd>set spell!<cr>",
        options = { silent = true },
        description = "Enable or disable spell checking",
    },
    {
        mode = { "c" },
        lhs = "<m-p>",
        rhs = "<up>",
        options = {},
        description = "Look up history",
    },
    {
        mode = { "c" },
        lhs = "<m-n>",
        rhs = "<down>",
        options = {},
        description = "Look down history",
    },
    {
        mode = { "n", "x" },
        lhs = "k",
        rhs = function()
            return vim.v.count > 0 and "k" or "gk"
        end,
        options = { silent = true, expr = true },
        description = "Move up one line",
    },
    {
        mode = { "n", "x" },
        lhs = "j",
        rhs = function()
            return vim.v.count > 0 and "j" or "gj"
        end,
        options = { silent = true, expr = true },
        description = "Move down one line",
    },
    {
        mode = { "n", "x" },
        lhs = "H",
        rhs = function()
            return vim.v.count > 0 and "^" or "g^"
        end,
        options = { silent = true, expr = true },
        description = "Move to the first character at the beginning of the line",
    },
    {
        mode = { "n", "x" },
        lhs = "L",
        rhs = function()
            return vim.v.count > 0 and "$" or "g$"
        end,
        options = { silent = true, expr = true },
        description = "Move to the last character at the end of the line",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-w>",
        rhs = "<c-right>",
        options = {},
        description = "Jump to next word in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-b>",
        rhs = "<c-left>",
        options = {},
        description = "Jump to previous word in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-k>",
        rhs = "<up>",
        options = {},
        description = "Move cursor up in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-j>",
        rhs = "<down>",
        options = {},
        description = "Move cursor down in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-h>",
        rhs = "<left>",
        options = {},
        description = "Move cursor left in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-l>",
        rhs = "<right>",
        options = {},
        description = "Move cursor right in insert mode",
    },
    {
        mode = { "n" },
        lhs = "<leader>.",
        rhs = "<cmd>lua require('telescope.builtin').find_files({cwd = vim.fn.expand('%:p:h')})<cr>",
        options = { silent = true },
        description = "Find Files Here",
    },
    {
        mode = { "n" },
        lhs = "<leader>q",
        rhs = "<cmd>qall<CR>",
        options = { silent = true },
        description = "Quit Neovim",
    },
    {
        mode = { "n","i" },
        lhs = "<c-s>",
        rhs = "<cmd>wall!<CR>",
        options = { silent = true },
        description = "Save",
    },
    {
        mode = { "n" },
        lhs = "<leader>w",
        rhs = "<cmd>w!<CR>",
        options = { silent = true },
        description = "Save All",
    },
    {
        mode = { "n" },
        lhs = "<leader>df",
        rhs = "<cmd>lua vim.lsp.buf.format { async=true }<cr>",
        options = { silent = true },
        description = "Format Document",
    },
    {
        mode = { "n" },
        lhs = "<leader>ls",
        rhs = "<cmd>Telescope lsp_document_symbols<cr>",
        options = { silent = true },
        description = "Find Document Symbol",
    },
    {
        mode = { "n" },
        lhs = "<leader>/",
        rhs = function()
            require("Comment.api").toggle.linewise.current()
        end,
        options = { silent = true },
        description = "Toggle Comment",
    },
    {
        mode = { "v" },
        lhs = "<leader>/",
        rhs = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        options = { silent = true },
        description = "Toggle Comment",
    },
    {
        mode = { "n" },
        lhs = "<leader>fr",
        rhs = "<cmd>lua require('telescope.builtin').registers()<CR>",
        -- rhs = function()
        --     require("telescope.builtin").oldfiles()
        -- end,
        options = { silent = true },
        description = "Find register, paste the content.",
    },
    {
        mode = { "n" },
        lhs = "<leader>e",
        rhs = "<cmd>lua require('telescope.builtin').oldfiles()<CR>",
        -- rhs = function()
        --     require("telescope.builtin").oldfiles()
        -- end,
        options = { silent = true },
        description = "Find files history",
    },
    {
        mode = { "v" },
        lhs = "<tab>",
        rhs = ">gv",
        options = { silent = true },
        description = "block indent left",
    },
    {
        mode = { "v" },
        lhs = "<s-tab>",
        rhs = "<gv",
        options = { silent = true },
        description = "block indent right",
    },
    {
        mode = { "n" },
        lhs = "<tab>",
        rhs = "v>",
        options = { silent = true },
        description = "line indent left",
    },
    {
        mode = { "n" },
        lhs = "<s-tab>",
        rhs = "v<",
        options = { silent = true },
        description = "line indent right",
    },
})


return mapping
