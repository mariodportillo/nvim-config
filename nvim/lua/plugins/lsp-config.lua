return {
	-- Mason (LSP installer)
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP config (auto-installs LSPs)
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ast_grep",
					"cmake",
					"pyright",
					"clangd",
					"html",
					"cssls",
					"ts_ls",
					"jsonls", -- Added CSS, TypeScript, JavaScript, React (via tsserver)
				},
			})
		end,
	},

	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- AST Grep
			lspconfig.ast_grep.setup({ capabilities = capabilities })

			-- CMake
			lspconfig.cmake.setup({ capabilities = capabilities })

			-- Python
			lspconfig.pyright.setup({ capabilities = capabilities })

			-- C/C++
			lspconfig.clangd.setup({ capabilities = capabilities })

			-- HTML
			lspconfig.html.setup({ capabilities = capabilities })

			-- CSS
			lspconfig.cssls.setup({ capabilities = capabilities })

			-- TypeScript & JavaScript (includes React support)
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
			})

			-- JSON
			lspconfig.jsonls.setup({ capabilities = capabilities })

			-- Keybindings
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
