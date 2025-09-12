return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" }, -- Start GDB in DAP mode
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          -- Attempt to find the most recently modified file
          local handle = io.popen("ls -1t | head -n 1") -- List files, sort by time, pick the latest
          local default_executable = "a.out"       -- Default fallback

          if handle then
            local result = handle:read("*l") -- Read first line (latest file)
            handle:close()
            if result and #result > 0 then
              default_executable = result
            end
          end

          -- Prompt the user with the detected or default executable
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/" .. default_executable, "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    -- Open DAP UI automatically
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Keybindings
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end,
}
