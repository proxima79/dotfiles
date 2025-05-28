return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- load on startup
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  require("catppuccin").setup({
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      telescope = true,
      which_key = true,
      lualine = true,
      mason = true,
    },
  }),
  vim.cmd.colorscheme("catppuccin-mocha"),
}
