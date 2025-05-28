local lspconfig = require("lspconfig")

local pid = vim.fn.getpid()
lspconfig.omnisharp.setup({
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
  -- Add your on_attach and capabilities here if needed
})
