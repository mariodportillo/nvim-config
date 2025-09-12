
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,

        -- C / C++
        null_ls.builtins.formatting.clang_format,

        -- JavaScript / TypeScript
        null_ls.builtins.formatting.prettier,
      },
    })

    -- Keybinding to format
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
