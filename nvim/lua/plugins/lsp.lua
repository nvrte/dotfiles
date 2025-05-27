return {
	-- LSP installer and manager
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"gopls",
					"ts_ls",
					"html",
					"cssls",
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.ts_ls = lspconfig.tsserver
			local servers = { "pyright", "gopls", "ts_ls", "html", "cssls", "clangd" }

			for _, server in ipairs(servers) do
				lspconfig[server].setup({capabilities = capabilities,})
			end

			-- Basic LSP keybinds
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		end,
	},
}


