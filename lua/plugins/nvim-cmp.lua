return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind-nvim", -- Vscode-like pictograms for nvim lsp completion items
	},

	config = function()
		vim.api.nvim_set_hl(0, "MyNormalFloat", { fg = "#29a4bd" })
		-- luasnip setup
		local luasnip = require("luasnip")
		-- some shorthands...
		local s = luasnip.snippet
		local t = luasnip.text_node
		local i = luasnip.insert_node

		luasnip.add_snippets("typescriptreact", {
			s("log", {
				t("console.log("),
				i(1, ""),
				t(","),
				i(2, ""),
				t(")"),
			}),
		})
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()

		-- nvim-cmp setup
		cmp.setup({
			enabled = function()
				-- turn off cmp in Telescope buffer
				local buftype = vim.api.nvim_buf_get_option(0, "buftype")
				if buftype == "prompt" then
					return false
				end
				-- disable completion in comments
				local context = require("cmp.config.context")
				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp", priority = 30, group_index = 2 },
				{ name = "luasnip", priority = 20, group_index = 2 },
				{ name = "buffer", priority = 10, group_index = 2 },
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "single",
					winhighlight = "Normal:Pmenu,FloatBorder:MyNormalFloat,CursorLine:PmenuSel,Search:None",
					col_offset = 0,
					side_padding = 1,
					scrollbar = false,
				}),
				documentation = {
					border = { "", "", "", " ", "", "", "", " " }, -- Add border for documentation
					winhighlight = "Normal:Pmenu,FloatBorder:NormalFloat,CursorLine:Visual,Search:None",
				},
			},
			experimental = {
				ghost_text = false,
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. strings[1] .. " "
					kind.menu = "    (" .. strings[2] .. ")"

					return kind
				end,
			},
			--[[ formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations [symbol | text | symbol_text | text_symbol]
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			},
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	}, ]]
		})
	end,
}
