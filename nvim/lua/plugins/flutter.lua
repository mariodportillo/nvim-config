return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- better UI for device/emulator selection
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = true, -- shows current device in lualine
          },
        },
        widget_guides = {
          enabled = false, -- set true if you want experimental indent guides
        },
        closing_tags = {
          highlight = "Comment",
          prefix = " > ",
          enabled = true,
        },
        dev_log = {
          enabled = true,
          open_cmd = "15split",
          focus_on_open = true,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        lsp = {
          capabilities = capabilities,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      })

      -- Load telescope integration (you already have telescope installed)
      require("telescope").load_extension("flutter")

      -- Keybindings
      vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", { desc = "Flutter Run" })
      vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })
      vim.keymap.set("n", "<leader>fR", "<cmd>FlutterReload<cr>", { desc = "Flutter Reload" })
      vim.keymap.set("n", "<leader>fS", "<cmd>FlutterRestart<cr>", { desc = "Flutter Restart" })
      vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Flutter Devices" })
      vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", { desc = "Flutter Emulators" })
      vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Flutter Outline" })
      vim.keymap.set("n", "<leader>fl", "<cmd>FlutterLogToggle<cr>", { desc = "Flutter Log" })
      vim.keymap.set("n", "<leader>ft", "<cmd>Telescope flutter commands<cr>", { desc = "Flutter Commands" })
    end,
  },
}
