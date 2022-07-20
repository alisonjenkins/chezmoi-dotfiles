local cmp = require "cmp"
local compare = require "cmp.config.compare"
local lspkind = require "lspkind"

local source_mapping = {
  nvim_lsp = "[LSP]",
  cmp_tabnine = "[TN]",
  buffer = "[BUF]",
  nvim_lua = "[LUA]",
  path = "[PATH]",
}

cmp.setup {
  completion = {
    border = "rounded",
    winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
  },
  confirm_opts = {
    border = "rounded",
    select = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]

      if entry.source.name == "copilot" then
        vim_item.kind = "[] Copilot"
        vim_item.kind_hl_group = "CmpItemKindCopilot"
        return vim_item
      end

      if entry.source.name == "cmp_tabnine" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. " " .. menu
        end
        vim_item.kind = ""
        vim_item.kind_hl_group = "CmpItemKindTabnine"
      end

      vim_item.menu = menu
      return vim_item
    end,
  },
  mapping = {
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "copilot" },
    { name = "cmp_tabnine" },
    { name = "nvim_lsp" },
    { name = "cmp_pandoc" },
    { name = "cmdline" },
    { name = "crates" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "orgmode" },
    { name = "buffer" },
    { name = "spell" },
    { name = "path", keyword_length = 5 },
    { name = "fuzzy_path" },
    { name = "fuzzy_buffer" },
    {
      name = "tmux",
      option = {
        all_panes = true,
        label = "[tmux]",
      },
    },
    { name = "nvim_lsp_signature_help" },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,
      require("copilot_cmp.comparators").score,
      require "cmp_tabnine.compare",
      require "cmp_fuzzy_path.compare",
      require "cmp_fuzzy_buffer.compare",
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  sources = {
    { name = "fuzzy_buffer" },
    { name = "nvim_lsp_document_symbol" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources {
    { name = "fuzzy_path" },
    { name = "cmdline" },
  },
})

require("cmp_pandoc").setup()
