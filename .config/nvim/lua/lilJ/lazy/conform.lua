return {

	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				html = { "htmlbeautifier" },
				css = { "prettierd", "prettier" },
				python = { "flake8" },
			},
		})

		vim.keymap.set({ "n", "v" }, "ff", function()
			conform.format({
                lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.api.nvim_buf_create_user_command(0, "ConformFormat", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, {})
	end,
}
