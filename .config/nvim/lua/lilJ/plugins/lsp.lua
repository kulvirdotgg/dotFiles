return {
    "neovim/nvim-lspconfig",

    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        -- Useful status updates for LSP.
        { "j-hui/fidget.nvim", opts = {} },
        "b0o/SchemaStore.nvim",

        -- Allows extra capabilities provided by blink.cmp
        "saghen/blink.cmp",
    },

    config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- Opens a popup that displays documentation about the word under your cursor
                --  See `:help K` for why this keymap.
                map("K", function()
                    vim.lsp.buf.hover { border = "rounded" }
                end, "Hover Documentation")

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                -- Rename the variable under your cursor.
                --  Most Language Servers support renaming across files, etc.
                map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

                -- Find references for the word under your cursor.
                map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                --  This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                -- Jump to the type of the word under your cursor.
                --  Useful when you're not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

                -- NOTE: commenting this untile I figure out when to use it
                -- Fuzzy find all the symbols in your current workspace.
                --  Similar to document symbols, except searches over your entire project.
                -- map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
                ---
                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                -- map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
                then
                    local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
                        end,
                    })
                end

                -- NOTE: commenting this untile I figure out when to use it
                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                -- This may be unwanted, since they displace some of your code
                --
                -- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                --     map("<leader>th", function()
                --         vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                --     end, "[T]oggle Inlay [H]ints")
                -- end
            end,
        })

        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config {
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.INFO] = "󰋽 ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                },
            } or {},
            virtual_text = {
                source = "if_many",
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        }

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- enable the following language servers
        --  Add any additional override configuration in the following tables. Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        local servers = {
            gopls = {
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
            },
            jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            },
            lua_ls = {
                -- cmd = {...},
                -- filetypes = { ...},
                -- capabilities = {},
                settings = {
                    lua = {
                        completion = {
                            callsnippet = "replace",
                        },
                        -- you can toggle below to ignore lua_ls's noisy `missing-fields` warnings
                        -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            },
            ts_ls = {},

            tailwindcss = {
                filetypes = { "html", "css", "typescript", "typescriptreact", "astro" },
            },
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "gofumpt",
            "goimports-reviser",
            "jsonlint",
            "prettier",
            "stylua",
        })

        require("mason-tool-installer").setup { ensure_installed = ensure_installed }

        require("mason-lspconfig").setup {
            ensure_installed = {}, -- explicitly set to an empty table because we populates installs via mason-tool-installer
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        }
    end,
}
