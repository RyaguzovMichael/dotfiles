return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        ---@module 'neo-tree'
        ---@type neotree.Config
        opts = {
            popup_border_style = "",
            window = {
                position = "float",
            },
            enable_git_status = false,
            enable_diagnostics = false,
        },
    },
}
