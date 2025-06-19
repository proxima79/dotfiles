-- File: ~/.config/nvim/lua/plugins/ken-dap.lua

return {
  "rcarriga/nvim-dap-ui",
  lazy = false, -- always load
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope.nvim",
    "jbyuki/one-small-step-for-vimkind",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local telescope = require("telescope.builtin")

    local dap = require("dap")
    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }

    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 0.25,
          position = "left",
        },
        {
          elements = { "repl", "console" },
          size = 0.25,
          position = "bottom",
        },
      },
      -- controls = {
      --   enabled = true,
      --   element = "repl",
      --   icons = {
      --     pause = "",
      --     play = "",
      --     step_into = "",
      --     step_over = "",
      --     step_out = "",
      --     step_back = "",
      --     run_last = "↻",
      --     terminate = "□",
      --   },
      -- },
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_value_lines = 100,
      },
    })

    -- Automatically open/close dapui when debugging starts/stops
    dap.listeners.after.event_initialized["dapui_config"] = function()
      vim.schedule(function()
        dapui.open()
      end)
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      vim.schedule(function()
        dapui.close()
      end)
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      vim.schedule(function()
        dapui.close()
      end)
    end

    -- Signs
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
    )

    -- .NET Debugger config
    dap.adapters.coreclr = {
      type = "executable",
      command = "/home/kenr/Documents/debuggers/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Launch .NET DLL",
        request = "launch",
        program = function()
          local pickers = require("telescope.pickers")
          local finders = require("telescope.finders")
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          local conf = require("telescope.config").values
          vim.notify("cwd: " .. tostring(vim.fn.getcwd()))

          -- Find project root from current buffer's .cs file
          local buf_path = vim.api.nvim_buf_get_name(0)
          local function find_project_root(path)
            local sep = package.config:sub(1, 1)
            local dir = vim.fn.fnamemodify(path, ":p:h")
            while dir ~= "" and dir ~= sep do
              local csproj = vim.fn.globpath(dir, "*.csproj")
              if csproj ~= "" then
                return dir
              end
              if vim.fn.isdirectory(dir .. sep .. ".git") == 1 then
                return dir
              end
              dir = vim.fn.fnamemodify(dir, ":h")
            end
            return vim.fn.getcwd()
          end

          local dll_dir = find_project_root(buf_path) .. "/bin/Debug/"

          -- Find the .csproj file name (without extension)
          local csproj_files = vim.fn.globpath(find_project_root(buf_path), "*.csproj", false, true)
          local project_name = nil
          if #csproj_files > 0 then
            local csproj = csproj_files[1]
            project_name = vim.fn.fnamemodify(csproj, ":t:r")
          end
          local handle = io.popen('fd --extension dll . "' .. dll_dir .. '"')
          local result = handle and handle:read("*a") or ""
          if handle then
            handle:close()
          end
          local files = {}
          for file in result:gmatch("[^\r\n]+") do
            table.insert(files, file)
          end
          -- Set the default selection index to the first matching DLL (the name of the project)
          local preselect_idx = 1
          if project_name then
            for i, file in ipairs(files) do
              if file:match(project_name .. "%.dll$") then
                preselect_idx = i
                break
              end
            end
          end

          local co = coroutine.running()
          pickers
            .new({}, {
              prompt_title = "Pick DLL to Debug",
              finder = finders.new_table({ results = files }),
              sorter = conf.generic_sorter({}),
              default_selection_index = preselect_idx,
              attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  coroutine.resume(co, selection[1])
                end)
                return true
              end,
            })
            :find()
          return coroutine.yield()
        end,
      },
    }

    -- Keybindings
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    map("n", "<F5>", function()
      require("dap").continue()
    end, opts)
    map("n", "<F9>", function()
      require("dap").toggle_breakpoint()
    end, opts)
    map("n", "<F10>", function()
      require("dap").step_over()
    end, opts)
    map("n", "<F11>", function()
      require("dap").step_into()
    end, opts)
    map("n", "<F8>", function()
      require("dap").step_out()
    end, opts)
    map("n", "<leader>dr", function()
      require("dap").repl.open()
    end, opts)
    map("n", "<leader>dl", function()
      require("dap").run_last()
    end, opts)
    map("n", "<space>?", function()
      require("dapui").eval(nil, { enter = true })
    end, opts)
    -- vim.api.nvim_create_autocmd("CursorHold", {
    --   pattern = "*",
    --   callback = function()
    --     local dapui = require("dapui")
    --     dapui.eval(nil, { enter = true, context = nil, width = nil, height = nil })
    --   end,
    --   desc = "Show DAP eval on hover",
    -- })
  end,
}
