local cmp = require("cmp")
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
	documentation = {
		border = "single",
		winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
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
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-e>"] = cmp.mapping.close(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "cmp_pandoc" },
		{ name = "cmdline" },
		{ name = "crates" },
		{ name = "nvim_lua" },
		{ name = "orgmode" },
		{ name = "cmp_tabnine" },
		{ name = "buffer" },
		{ name = "spell" },
		{ name = "path", keyword_length = 5 },
	},
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
