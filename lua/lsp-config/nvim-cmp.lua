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

local function border(hl_name)
	return {
		{ "┌", hl_name },
		{ "─", hl_name },
		{ "┐", hl_name },
		{ "│", hl_name },
		{ "┘", hl_name },
		{ "─", hl_name },
		{ "└", hl_name },
		{ "│", hl_name },
		--[[ { "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name }, ]]
	}
end

-- nvim-cmp setup
cmp.setup({
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
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
	window = {
		completion = {
			border = border("CmpBorder"), -- Add border
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = 0,
			side_padding = 0,
		},
		documentation = {
			border = border("CmpBorder"), -- Add border for documentation
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind =
				lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50, ellipsis_char = "..." })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")"

			return kind
		end,
	},
	--[[ formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations [symbol | text | symbol_text | text_symbol]
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
