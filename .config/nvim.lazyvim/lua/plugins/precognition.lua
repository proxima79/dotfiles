return {
  {
    "tris203/precognition.nvim",
    config = function()
      require("precognition").setup({
        enable_auto_completion = true,
        highlight_syntax = true,
      })
    end,
  },
}
