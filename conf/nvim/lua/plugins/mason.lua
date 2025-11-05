return {
    {
        "mason-org/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
            ensure_installed = {
                "json-lsp",

                -- csharp
                "roslyn",
                "csharpier",
                "netcoredbg",

                --rust
                "rust-analyzer",
            },
        },
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {},
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                cs = { "csharpier" },
            },
            formatters = {
                csharpier = {
                    command = "home/famine/.dotnet/tools/csharpier",
                    args = { "--write-stdout", "--single-file" },
                },
            },
        },
    },
    {
        "Saecki/crates.nvim",
        tag = "stable",
        config = function()
            require("crates").setup({
                lsp = {
                    enabled = true,
                    actions = true,
                    completion = true,
                    hover = true,
                },
            })
        end,
    },
}
