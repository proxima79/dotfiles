return {
  "rcarriga/nvim-dap-ui",
  config = function()
    local dap = require("dap")
    print("nvim-dap-ui config")

    dap.adapters.coreclr = {
      type = "executable",
      command = "/home/kenr/Documents/debuggers/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.adapters.netcoredbg = {
      type = "executable",
      command = "/home/kenr/Documents/debuggers/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          -- return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/src/", "file")
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net8.0/", "file")
        end,

        -- justMyCode = false,
        -- stopAtEntry = false,
        -- -- program = function()
        -- --   -- todo: request input from ui
        -- --   return "/path/to/your.dll"
        -- -- end,
        -- env = {
        --   ASPNETCORE_ENVIRONMENT = function()
        --     -- todo: request input from ui
        --     return "Development"
        --   end,
        --   ASPNETCORE_URLS = function()
        --     -- todo: request input from ui
        --     return "http://localhost:5050"
        --   end,
        -- },
        -- cwd = function()
        --   -- todo: request input from ui
        --   return vim.fn.getcwd()
        -- end,
      },
    }

    local map = vim.keymap.set

    local opts = { noremap = true, silent = true }

    -- Eval var under cursor
    -- map("n", "<space>?", function()
    -- require("dapui").eval(nil, { enter = true })
    -- end)

    map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
    map("n", "<F6>", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
    map("n", "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
    map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
    map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
    map("n", "<F8>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
    -- map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
    map("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
    map("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
    map(
      "n",
      "<leader>dt",
      "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
      { noremap = true, silent = true, desc = "debug nearest test" }
    )
  end,
}
