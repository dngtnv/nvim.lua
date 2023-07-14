return {
	"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
	cmd = "LspInfo",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"html",
				"cssls",
				"tsserver",
				"tailwindcss",
				"lua_ls",
				"pyright",
				"ruff_lsp",
			},
		})
		local nvim_lsp = require("lspconfig")

		-- Custom diagnostics sign & message
		vim.diagnostic.config({
			virtual_text = {
				prefix = " ", -- Could be '■', '▎', '●', '󱓻', '', '', '', '', ''
				source = "always", -- Or "if_many"
			},
			float = {
				source = "always", -- Or "if_many"
			},
			signs = true,
			underline = true,
			update_in_insert = true, -- Update diagnostics in insert mode
			severity_sort = false,
		})
		local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(_, bufnr) -- (client, bufnr)
			-- Show diagnostic on hover
			--[[ vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = "rounded",
                    source = "always",
                    prefix = " ",
                    scope = "cursor",
                }
                vim.diagnostic.open_float(nil, opts)
            end,
        }) ]]
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { noremap = true, silent = true, buffer = bufnr }
			--[[ vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) ]]
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end

		local lsp_flags = {
			-- This is the default in Nvim 0.7+
			debounce_text_changes = 150,
		}

		-- Add additional capabilities supported by nvim-cmp
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local servers = {
			"html",
			"cssls",
			"tsserver",
			"eslint",
			"tailwindcss",
			"lua_ls",
			"pyright",
		}

		for _, lsp in ipairs(servers) do
			nvim_lsp[lsp].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})
		end
	end,
}
