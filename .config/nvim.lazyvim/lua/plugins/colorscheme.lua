return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- load on startup
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        term_colors = true,
        styles = {
          comments = { "italic" },
          functions = { "italic" },
          keywords = { "italic" },
          variables = { "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          which_key = true,
          -- lualine = true,
          mason = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
