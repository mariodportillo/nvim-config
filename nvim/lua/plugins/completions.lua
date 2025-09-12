return {
  -- LSP Completion Source
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  -- Snippet Engine & Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- Main Completion Plugin
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load Snippets
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load() -- Loads VSCode-style snippets

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },   -- LSP completions (Python, C, C++)
          { name = "luasnip" },    -- Snippets
          { name = "path" },       -- File path completion
        }, {
          { name = "buffer" },     -- Text buffer completion
        }),
      })
    end,
  },

  -- Additional Completion Sources
  {
    "hrsh7th/cmp-buffer",  -- Buffer words completion
  },
  {
    "hrsh7th/cmp-path",    -- File path completion
  },
  {
    "hrsh7th/cmp-cmdline", -- Command-line completion
  },
}
