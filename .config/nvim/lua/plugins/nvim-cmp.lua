return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-Space>"] = cmp.mapping.complete(),
      -- ["<CR>"] = LazyVim.cmp.confirm({ select = false }),
      ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
      ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
      ["<tab>"] = function(fallback)
        -- return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
        return LazyVim.cmp.map({ "confirm", "ai_accept" }, fallback)()
      end,
    })
  end,
}
