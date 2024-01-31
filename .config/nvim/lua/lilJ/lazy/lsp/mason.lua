return {
    "williamboman/mason.nvim",

    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        "ray-x/go.nvim",
        "ray-x/guihua.lua",
        "j-hui/fidget.nvim",
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
    },
    
    config = function()
        require("fidget").setup({
            progress = {
                display = {
                    render_limit = 3,
                },
            },
        })


        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")
        local lspconfig = require("lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        local on_attach = function(_, bufnr)
            local buf_map = vim.api.nvim_buf_set_keymap
            
            local opts = { noremap = true, silent = true }

            buf_map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

            buf_map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

            buf_map(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

            buf_map(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)

            buf_map(bufnr, { "n", "v" }, "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)

            buf_map(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)

            buf_map(bufnr, "n", "<leader>vd", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

            buf_map(bufnr, "n", "<leader>rr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)

            buf_map(bufnr, "i", "<C-h>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

            buf_map(bufnr, "n", "<leader>ws", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
        end


        require("go").setup({
            max_line_len = 120,
            comment_placeholder = "   ",
        })

        local format_go = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                require('go.format').goimport()
            end,
            group = format_go,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_lsp.default_capabilities(capabilities)

        mason_lspconfig.setup({
            ensure_installed = {
                "clangd",
                "cssls",
                "gopls",
                "html",
                "java_language_server",
                "pyright",
                "tailwindcss",
                "tsserver",
            },

            automatic_installation = true,

            handlers = {
                function(server_name)
                    -- print("another server " .. server_name)
                    lspconfig[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            [server_name] = {
                                analyses = {
                                    unusedparams = true,
                                    shadow = true,
                                },
                                staticcheck = true,
                            },
                        },
                    }
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = {"vim"} },
                            },
                        },
                    })
                end,
            },
        })
    end,
}
