local aux_packer = require("utils.aux.packer")

local plugins = {}

plugins.basic = {
    { "wbthomason/packer.nvim" },
    { "rcarriga/nvim-notify" },
    { "tpope/vim-repeat" },
    { "nvim-lua/plenary.nvim", module = "plenary" },
    { "williamboman/mason.nvim", after = { "nvim-notify" } },
    { "nvim-treesitter/nvim-treesitter", module = "nvim-treesitter", run = { ":TSUpdate" } },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
}

plugins.theme = {
    { "askfiy/starlight" },
    { "rebelot/kanagawa.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "folke/tokyonight.nvim" },
    { "projekt0n/github-nvim-theme" },
    { "RRethy/nvim-base16" },
    { "Everblush/everblush.nvim" },
    { "savq/melange" },
    { "Shatur/neovim-ayu" },
    { "catppuccin/nvim", as = "catppuccin" },
}

plugins.lsp = {
    { "williamboman/mason-lspconfig.nvim", after = { "mason.nvim" } },
    { "folke/neodev.nvim", after = { "mason-lspconfig.nvim" } },
    { "SmiteshP/nvim-navic", after = { "neodev.nvim" } },
    { "neovim/nvim-lspconfig", after = { "nvim-navic" } },
    { "j-hui/fidget.nvim", after = { "nvim-lspconfig" } },
    { "kosayoda/nvim-lightbulb", after = { "nvim-lspconfig" } },
    { "jose-elias-alvarez/null-ls.nvim", after = { "nvim-lspconfig" } },
}

plugins.complete = {
    { "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } },
    { "hrsh7th/vim-vsnip", after = { "friendly-snippets" } },
    { "hrsh7th/nvim-cmp", after = { "vim-vsnip" } },
    { "hrsh7th/cmp-vsnip", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-buffer", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-path", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-cmdline", after = { "nvim-cmp" } },
    { "kristijanhusak/vim-dadbod-completion", after = { "nvim-cmp" } },
    { "tzachar/cmp-tabnine", run = "./install.sh", after = { "nvim-cmp" } },
    { "github/copilot.vim", ft = { "dap-repl" }, event = { "InsertEnter" } },
}

plugins.dap = {
    { "mfussenegger/nvim-dap", module = "dap" },
    { "theHamsta/nvim-dap-virtual-text", after = { "nvim-dap" } },
    { "rcarriga/nvim-dap-ui", after = { "nvim-dap" } },
}
plugins.editor = {
    { "mrjones2014/nvim-ts-rainbow" },
    { "AndrewRadev/switch.vim" },
    { "Shatur/neovim-session-manager" },
    { "jbyuki/venn.nvim", module = "venn" },
    { "windwp/nvim-autopairs", event = { "InsertEnter" } },
    { "ur4ltz/surround.nvim", event = { "BufRead", "BufNewFile" } },
    { "RRethy/vim-illuminate", event = { "BufRead", "BufNewFile" } },
    { "lukas-reineke/indent-blankline.nvim", after = { "nvim-treesitter" } },
    { "windwp/nvim-ts-autotag", after = { "nvim-treesitter" } },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter" } },
    {
        "numToStr/Comment.nvim",
        module = { "Comment" },
        after = { "nvim-ts-context-commentstring" },
    },
    {
        "mg979/vim-visual-multi",
        fn = { "vm#commands#add_cursor_up", "vm#commands#add_cursor_down" },
        keys = { "<c-n>" },
    },
    {
        "max397574/better-escape.nvim",
        event = { "InsertEnter" },
    },
    { "alexghergh/nvim-tmux-navigation" },
    {
        "cbochs/grapple.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    },
    { "chentoast/marks.nvim" },
}

plugins.lanaguage = {
    { "davidgranstrom/nvim-markdown-preview", ft = { "markdown" } },
    { "Vimjas/vim-python-pep8-indent", ft = { "python" }, event = { "InsertEnter" } },
}

plugins.find = {
    { "tami5/sqlite.lua" },
    { "kevinhwang91/nvim-hlslens" },
    { "nvim-telescope/telescope.nvim" },
    { "AckslD/nvim-neoclip.lua", after = { "sqlite.lua" } },
    { "phaazon/hop.nvim", cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" } },
    { "folke/todo-comments.nvim", event = { "BufRead", "BufNewFile" } },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make", module = { "telescope._extensions.fzf" } },
}

plugins.tools = {
    { "uga-rosa/translate.nvim" },
    { "olimorris/persisted.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "askfiy/nvim-picgo", module = "nvim-picgo" },
    { "kristijanhusak/vim-carbon-now-sh", cmd = { "CarbonNowSh" } },
    { "lewis6991/gitsigns.nvim", event = { "BufRead", "BufNewFile" } },
    { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
    { "folke/which-key.nvim", event = { "BufRead", "BufNewFile" } },
}

plugins.views = {
    { "nvim-lualine/lualine.nvim", after = { "nvim-web-devicons" } },
    { "stevearc/aerial.nvim", after = { "lualine.nvim" } },
    { "nvim-pack/nvim-spectre", module = "spectre" },
    { "mbbill/undotree", event = { "BufRead", "BufNewFile" } },
    { "kyazdani42/nvim-tree.lua", cmd = { "NvimTreeToggle", "NvimTreeFindFile" } },
    { "akinsho/bufferline.nvim", events = { "BufNewFile", "BufRead", "TabEnter" } },
    { "tpope/vim-dadbod", fn = { "db#resolve" } },
    { "kristijanhusak/vim-dadbod-ui", cmd = { "DBUIToggle" } },
    { "dstein64/nvim-scrollview", event = { "BufRead", "BufNewFile" } },
    { "akinsho/toggleterm.nvim", module = "toggleterm" },
    { "propet/colorscheme-persist.nvim" },
}

aux_packer.entry(plugins)

return plugins
