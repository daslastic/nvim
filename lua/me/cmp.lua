local cmp = require("cmp")

local luasnip = safe_require("luasnip")
if not luasnip then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    expandable_indicator = false,
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "LSP",
        emoji = "Emoji",
        path = "Path",
        vsnip = "Snippet",
        luasnip = "Snippet",
        buffer = "Buffer",
        fish = "Fish",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
    { name = "fish" },
    { name = "crates" }, -- check autocommands
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }),
})
