local cmp = require("cmp")
local compare = require('cmp.config.compare')
local lspkind = require("lspkind")

local source_mapping = {
	nvim_lsp = "[LSP]",
	cmp_tabnine = "[TN]",
	buffer = "[BUF]",
	nvim_lua = "[LUA]",
	path = "[PATH]",
}

cmp.setup({
	completion = {
		autocomplete = { cmp.TriggerEvent.TextChanged },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = false,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end

			vim_item.menu = menu
			return vim_item
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
		["<C-e>"] = cmp.mapping(
			{
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}
		),
		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-g>"] = cmp.mapping(function(fallback)
			vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
		end),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		{ name = "cmp_pandoc" },
		{ name = "cmp_copilot" },
		{ name = "cmdline" },
		{ name = "crates" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "orgmode" },
		{ name = "buffer" },
		{ name = "spell" },
		{ name = "path", keyword_length = 5 },
		{
			name = "tmux" ,
			option = {
				all_panes = true,
				label = '[tmux]',
			}
		},
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			require("cmp_tabnine.compare"),
			compare.offset,
			compare.exact,
			compare.score,
			compare.recently_used,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		}
	}
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

require("cmp_pandoc").setup()
