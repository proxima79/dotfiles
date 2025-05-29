return {
  "TimUntersberger/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim", -- Optional, for better diff views
    "nvim-telescope/telescope.nvim", -- Optional, for telescope integration
  },
  config = function()
    require("neogit").setup()
  end,
}
