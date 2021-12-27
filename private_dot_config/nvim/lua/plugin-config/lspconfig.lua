-- vim: set foldmethod=marker foldlevel=0:

-- local function show_documentation() --{{{
-- 	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
-- 		vim.cmd("h " .. vim.fn.expand("<cword>"))
-- 	else
-- 		vim.cmd("lua vim.lsp.buf.hover()")
-- 	end
-- end --}}}

local function custom_capabilities() --{{{
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	return capabilities
end --}}}

local function custom_on_attach(client, _) --{{{
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

	require("aerial").on_attach(client)
	require("lsp_signature").on_attach()
end --}}}

local function default(configs) --{{{
	local custom_config = {
		on_attach = custom_on_attach,
		capabilities = custom_capabilities(),
	}
	if configs ~= nil then
		for key, value in pairs(configs) do
			if value ~= nil then
				custom_config[key] = value
			end
		end
	end

	-- COQ auto completion configuration{{{
	-- vim.g.coq_settings = {
	-- 	auto_start = "shut-up",
	-- 	clients = {
	-- 		tabnine = {
	-- 			enabled = true,
	-- 			short_name = "TN",
	-- 		},
	-- 	},
	-- 	keymap = {
	-- 		bigger_preview = "<c-[>",
	-- 		jump_to_mark = "<c-]>",
	-- 	},
	-- }

	-- Register the COQ autocompletion for LSP completions
	-- custom_config = require("coq").lsp_ensure_capabilities(custom_config)}}}

	-- Register the cmp autocompletion for LSP completions

	return custom_config
end --}}}

local lsp_servers = {}

-- {{{ Bash
lsp_servers["bashls"] = {}
-- }}}

-- {{{ C
lsp_servers["clangd"] = {}
-- }}}

-- {{{ CSS
lsp_servers["cssls"] = {}
lsp_servers["cssls"]["cmd"] = { "lua-language-server", "--stdio" }
-- }}}

-- {{{ Docker
lsp_servers["dockerls"] = {}
-- }}}

-- {{{ Go
lsp_servers["gopls"] = {}
lsp_servers["gopls"]["settings"] = {
	gopls = {
		analyses = {
			unusedparams = true,
		},
		staticcheck = true,
		usePlaceholders = false,
	},
}
-- }}}

-- {{{ HTML
lsp_servers["html"] = {}
-- }}}

-- {{{ JSON
lsp_servers["jsonls"] = {}
lsp_servers["jsonls"]["cmd"] = { "vscode-json-languageserver", "--stdio" }
-- }}}

-- {{{ Lua
lsp_servers["sumneko_lua"] = {}
lsp_servers["sumneko_lua"]["cmd"] = {
	"lua-language-server",
	string.format("--logpath=%s/.cache/nvim/sumneko_lua", vim.loop.os_homedir()),
}
lsp_servers["sumneko_lua"]["settings"] = {
	Lua = {
		runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
		telemetry = {
			enable = false,
		},
		diagnostics = {
			enable = true,
			globals = { "vim", "awesome", "use", "client", "root", "s", "screen" },
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				["/usr/share/awesome/lib"] = true,
				["/usr/share/lua/5.1"] = true,
				["/usr/share/lua/5.3"] = true,
				["/usr/share/lua/5.4"] = true,
			},
		},
	},
}
-- }}}

-- {{{ Nix
-- lsp_servers["rnix"] = {}
-- }}}

-- {{{ Python - Pyright
lsp_servers["pyright"] = {}
lsp_servers["pyright"]["settings"] = {
	python = {
		analysis = {
			useLibraryCodeForTypes = false,
			autoSearchPaths = true,
			diagnosticMode = "openFilesOnly",
			typeCheckingMode = "basic",
		},
	},
}
-- }}}

-- {{{ Rust - rust-analyzer
lsp_servers["rust_analyzer"] = {}
-- }}}

-- {{{ SQL
lsp_servers["sqls"] = {}
lsp_servers["sqls"]["on_attach"] = function(client)
	client.resolved_capabilities.execute_command = true
	require("sqls").setup({ picker = "default" })
end
-- }}}

-- {{{ Terraform
lsp_servers["terraformls"] = {}
lsp_servers["terraformls"]["cmd"] = { "terraform-ls", "serve" }
-- }}}

-- {{{ Tex
lsp_servers["texlab"] = {}
-- }}}

-- {{{ Typescript
lsp_servers["tsserver"] = {}
lsp_servers["tsserver"]["settings"] = {
	tsserver = {
		useBatchedBufferSync = true,
	},
	javascript = {
		autoClosingTags = true,
		suggest = {
			autoImports = true,
		},
		updateImportsOnFileMove = {
			enable = true,
		},
		suggestionActions = {
			enabled = false,
		},
	},
}
-- }}}

-- {{{ Vim
lsp_servers["vimls"] = {}
-- }}}

-- {{{ YAML
lsp_servers["yamlls"] = {}
lsp_servers["yamlls"]["settings"] = {
	yaml = {
		format = {
			enable = true,
			singleQuote = true,
			bracketSpacing = true,
		},
		editor = {
			tabSize = 2,
		},
		schemas = {
			["https://json.schemastore.org/github-workflow.json"] = "ci.yml",
			["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
			["kubernetes"] = "/*",
		},
	},
}
-- }}}

require("toggle_lsp_diagnostics").init({ underline = false, virtual_text = { spacing = 4 } })

--{{{ LSP setup
local lsp_installer_servers = require("nvim-lsp-installer.servers")

for lsp_name, lsp_settings in pairs(lsp_servers) do
	local server_available, requested_server = lsp_installer_servers.get_server(lsp_name)
	if server_available then
		requested_server:on_ready(function()
			requested_server:setup(default(lsp_settings))
		end)
		if not requested_server:is_installed() then
			-- Queue the server to be installed
			requested_server:install()
		end
	end
end --}}}
