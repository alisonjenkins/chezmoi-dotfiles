-- if vim.g.snippets ~= "luasnip" then
-- 	return
-- end

local ls = require("luasnip")
local types = require("luasnip.util.types")
require("luasnip.loaders.from_vscode").load()

ls.config.set_config({
	-- This enables luasnip to keep around the last used snippet.
	-- You can jump back into it even if you move outside of it.
	history = true,

	-- Updates the snippet as you type
	updateevents = "TextChanged,TextChangedI",

	-- Autosnippets
	enable_autosnippets = true,

	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "←", "Error" } },
			},
		},
	},
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

ls.snippets = {
	all = {},

	lua = {},
}
