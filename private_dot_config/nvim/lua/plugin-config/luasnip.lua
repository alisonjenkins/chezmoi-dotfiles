-- if vim.g.snippets ~= "luasnip" then
-- 	return
-- end

local ls = require "luasnip"
local types = require "luasnip.util.types"
require("luasnip.loaders.from_vscode").load()

ls.config.set_config {
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
}

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

local s = ls.s
local t = ls.t
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.snippets = {
  all = {},

  terraform = {
    ls.parser.parse_snippet(
      "v",
      'variable "$1" {\n  type = ${2:string}\n  description = "$3"\n  default = ${0:null}\n}'
    ),

    ls.parser.parse_snippet(
      "sg",
      'resource "aws_security_group" "$1" {\n  name        = "$2"\n  description = "$3"\n  vpc_id      = ${4:local.vpc_id}\n\n  tags = {\n    Name = "$5"\n  }\n}'
    ),

    ls.parser.parse_snippet(
      "sgr",
      'resource "aws_security_group_rule" "$1" {\n  security_group_id = aws_security_group.$2.id\n  type              = "${3:ingress}"\n  from_port         = ${4:0}\n  to_port           = ${5:65535}\n  protocol          = "${6:all}"\n  cidr_blocks       = var.$7\n  source_security_group_id = aws_security_group.$8.id\n}'
    ),
    -- 	s("v", {
    -- 		fmt('variable "{}"', {
    -- 			i(1),
    -- 		}),
    -- 		t(" {\n"),
    -- 		fmt('  type = {}\n  description = "{}"\n  default = {}', {
    -- 			i(1, "string"),
    -- 			i(2, "Variable description"),
    -- 			i(3, "null"),
    -- 		}),
    -- 		t("\n}"),
    -- 	}),
  },

  lua = {},
}
