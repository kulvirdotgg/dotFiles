return {
    "echasnovski/mini.nvim",
    config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require("mini.ai").setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require("mini.surround").setup()

        local statusline = require "mini.statusline"
        statusline.setup { use_icons = vim.g.have_nerd_font }

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.active = function()
            local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
            local git = statusline.section_git {}
            local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
            local filename = statusline.section_filename { trunc_width = 140 }
            -- local fileinfo = statusline.section_fileinfo()
            local location = statusline.section_location()

            return statusline.combine_groups {
                { hl = mode_hl, strings = { mode } },
                { hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
                "%<",
                { hl = "MiniStatuslineFilename", strings = { filename } },
                "%=",
                -- { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                { hl = "MiniStatuslineDevinfo", strings = { git } },
                { hl = mode_hl, strings = { location } },
            }
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_diagnostics = function()
            local buffer_diagnostics = {
                errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }),
                warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }),
                info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }),
                hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }),
            }

            local diagnostics = {}
            if buffer_diagnostics.errors > 0 then
                table.insert(diagnostics, string.format(" :%d", buffer_diagnostics.errors))
            end
            if buffer_diagnostics.warnings > 0 then
                table.insert(diagnostics, string.format(" :%d", buffer_diagnostics.warnings))
            end
            if buffer_diagnostics.info > 0 then
                table.insert(diagnostics, string.format(" :%d", buffer_diagnostics.info))
            end
            if buffer_diagnostics.hints > 0 then
                table.insert(diagnostics, string.format(" :%d", buffer_diagnostics.hints))
            end
            return table.concat(diagnostics, " ")
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_fileinfo = function()
            local fname = vim.fn.expand "%:t"
            if fname == "" then
                fname = "[No Name]"
            end
            local readonly = vim.bo.readonly and "🔒" or ""
            local modified = vim.bo.modified and "[+]" or ""
            return string.format(" %s%s%s ", fname, readonly, modified)
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_git = function()
            local head = vim.b.gitsigns_head
            if not head or head == "" then
                return ""
            end
            return string.format(" %s", head)
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return "%2l:%-2v"
        end
    end,
}
